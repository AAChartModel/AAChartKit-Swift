/**
 * Highcharts plugin for creating individual rounded corners.
 * Alternative approach using drawPoints - potentially more compatible with v11/v12+.
 * Highcharts 原版 column && bar 圆角插件和自定义的 columnrange 圆角插件可能有点冲突(在 v11.4.8 版本的 Highcharts 中使用时, columnrange 插件会无法生效)
 * 原版插件地址 https://github.com/highcharts/rounded-corners
 * 这里的插件代码为 AI 改良兼容性之后的版本
 *
 * Author: Torstein Honsi, adapted by AI
 * Version: null
 * License: MIT License
 */
(function(factory) {
    // UMD header (same as before)
    if (typeof module === "object" && module.exports) {
        module.exports = factory;
    } else if (typeof define === 'function' && define.amd) {
        define('highcharts/modules/border-radius', ['highcharts'], function(H) {
            factory(H);
            return H;
        });
    } else {
        factory(typeof Highcharts !== 'undefined' ? Highcharts : void 0);
    }
}(function(H) {
    if (!H) {
        console.error("Highcharts not found. Please include Highcharts before this plugin.");
        return;
    }

    var rel = H.relativeLength;

    // Helper function to calculate the rounded path
    function getRoundedPath(shapeArgs, options) {
        var w = shapeArgs.width,
            h = shapeArgs.height,
            x = shapeArgs.x,
            y = shapeArgs.y;

        // Read effective border radius options
        // (Combine series and point options if necessary)
        var rTL = rel(options.borderRadiusTopLeft || 0, w),
            rTR = rel(options.borderRadiusTopRight || 0, w),
            rBR = rel(options.borderRadiusBottomRight || 0, w),
            rBL = rel(options.borderRadiusBottomLeft || 0, w);

        if (!(rTL || rTR || rBR || rBL)) {
            return null; // No rounding needed
        }

        var maxR = Math.min(w, h) / 2;

        // Cap radii
        rTL = Math.min(rTL, maxR);
        rTR = Math.min(rTR, maxR);
        rBR = Math.min(rBR, maxR);
        rBL = Math.min(rBL, maxR);

        // Define the path
        var path = [
            ['M', x + rTL, y],
            ['L', x + w - rTR, y],
            ['C', x + w - rTR / 2, y, x + w, y + rTR / 2, x + w, y + rTR],
            ['L', x + w, y + h - rBR],
            ['C', x + w, y + h - rBR / 2, x + w - rBR / 2, y + h, x + w - rBR, y + h],
            ['L', x + rBL, y + h],
            ['C', x + rBL / 2, y + h, x, y + h - rBL / 2, x, y + h - rBL],
            ['L', x, y + rTL],
            ['C', x, y + rTL / 2, x + rTL / 2, y, x + rTL, y],
            ['Z']
        ];
        return path;
    }

    // We might still need to wrap translate to ensure shapeArgs are calculated
    // but we won't modify shapeType or shapeArgs.d here.
    H.wrap(H.seriesTypes.column.prototype, "translate", function(proceed) {
        proceed.call(this);
        // Store options on point for easier access in drawPoints? Optional.
        /*
        var series = this;
        series.points.forEach(function(point) {
            if (point.shapeArgs) {
                 // You could store calculated radii here if complex logic needed
                 // point.customRadii = { ... };
            }
        });
        */
    });

    // Wrap drawPoints to modify the SVG element *after* it's drawn
    H.wrap(H.seriesTypes.column.prototype, "drawPoints", function(proceed) {
        // Let Highcharts draw the points first (likely as standard rects)
        proceed.call(this);

        var series = this,
            options = series.options; // Series-level options

        series.points.forEach(function(point) {
            // Ensure the point has been rendered and has shape arguments
            if (point.graphic && point.shapeArgs) {

                // Calculate the desired rounded path
                // Pass point.options if you want point-specific overrides
                var path = getRoundedPath(point.shapeArgs, options); // Or pass point.options merged with options

                if (path) {
                    // If a rounded path was generated, update the graphic's 'd' attribute
                    point.graphic.attr({
                        d: path
                    });
                }
                // If path is null (no rounding needed), do nothing,
                // let the original rect/path drawn by Highcharts remain.
                // If it was drawn as rect, setting 'd' will likely convert it?
                // Highcharts' attr method is usually smart about this.
            }
        });
    });
}));
