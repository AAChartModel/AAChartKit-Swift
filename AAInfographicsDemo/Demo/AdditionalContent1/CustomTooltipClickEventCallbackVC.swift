//
//  CustomTooltipClickEventCallbackVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/10/16.
//  Copyright © 2024 An An. All rights reserved.
//

import AAInfographics
import WebKit

class CustomTooltipClickEventCallbackVC: UIViewController {
    let kUserContentMessageNameTooltipClicked = "tooltipClicked"
    
    private var aaChartView: AAChartView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configureChartView()
        configureChartViewCustomEventMessageHandler()
        
        let aaOptions = configureChartOptions()
        aaChartView.aa_drawChartWithChartOptions(aaOptions)
    }
    
    private func configureChartView() {
        aaChartView = AAChartView()
        let chartViewWidth = view.frame.size.width
        let chartViewHeight = view.frame.size.height - 220
        aaChartView!.frame = CGRect(x: 0, y: 60, width: chartViewWidth, height: chartViewHeight)
        aaChartView!.isScrollEnabled = false//Disable chart content scrolling
        aaChartView!.isClearBackgroundColor = true
        aaChartView!.delegate = self as AAChartViewDelegate
        if #available(iOS 16.4, *) {
            aaChartView.isInspectable = true
        } else {
            // Fallback on earlier versions
        }
        view.addSubview(aaChartView!)
    }
    
    private func configureChartViewCustomEventMessageHandler() {
        aaChartView!.configuration.userContentController.add(AALeakAvoider.init(delegate: self), name: kUserContentMessageNameTooltipClicked)
    }
    
    //开发日志: ChatGPT的方法在 v11.3.0 版本中无效, 浪费了我大半天时间排查原因, 我向 Claude 提出如下问题后, 得到了兼容性更强的版本, 在 v11.3.0 上也能正常工作了
    //问题: 这个方法从哪个版本的 Highcharts 开始起效的? 我测试了一下发现在最新版本的 Highcharts 中是有效的, 但是在 v11.3.0 中, 此方法无效. 很奇怪是什么原因?

    
    /*
     ChatGPT 推荐的方法
     Highcharts.wrap(Highcharts.Tooltip.prototype, 'refresh', function (proceed, point, mouseEvent) {
         // 调用原始的 refresh 方法，确保 tooltip 正常显示
         proceed.apply(this, Array.prototype.slice.call(arguments, 1));

         const tooltip = this;
         const chart = tooltip.chart;

         // 缓存当前的 point 或 points 数据
         tooltip.currentPoints = point;

         // 检查是否已绑定 click 事件
         if (!chart.hasTooltipClickEvent) {
             chart.hasTooltipClickEvent = true;

             // 绑定 chart 的 container 的 click 事件
             Highcharts.addEvent(chart.container, 'click', function (e) {
                 const tooltipBox = tooltip.label && tooltip.label.getBBox();
                 if (tooltipBox) {
                     const { left, top } = chart.container.getBoundingClientRect();
                     const clickX = e.clientX - left;
                     const clickY = e.clientY - top;

                     // 检查点击是否在 tooltip 的范围内
                     if (
                         clickX >= tooltipBox.x &&
                         clickX <= tooltipBox.x + tooltipBox.width &&
                         clickY >= tooltipBox.y &&
                         clickY <= tooltipBox.y + tooltipBox.height
                     ) {
                         // 处理点击事件，并使用缓存的 points 数据
                         if (tooltip.currentPoints) {
                             const points = Array.isArray(tooltip.currentPoints) ? tooltip.currentPoints : [tooltip.currentPoints];
                             const tooltipContent = points.map(point => `Series: ${point.series.name}, X: ${point.x}, Y: ${point.y}`).join('\n');

                             // 发送消息或执行自定义逻辑
                             if (
                                 window.webkit &&
                                 window.webkit.messageHandlers &&
                                 window.webkit.messageHandlers.tooltipClicked
                             ) {
                                 window.webkit.messageHandlers.tooltipClicked.postMessage(tooltipContent);
                             }

                             console.log('Tooltip clicked:', tooltipContent);
                         }
                     }
                 }
             });
         }
     });

     */
    
    /*
     Claude 推荐的方案, 说明如下:
     很高兴能帮到你！这个解决方案之所以更稳定，主要是因为：

     1.使用了 getBoundingClientRect() 代替 getBBox()，这个 API 在处理元素位置和尺寸时更可靠
     2.通过 tooltip.label.element 直接操作 DOM 元素，而不是依赖 SVG 的特定属性
     
        // 兼容性更好的方案
        Highcharts.wrap(Highcharts.Tooltip.prototype, 'refresh', function(proceed, point) {
            proceed.call(this, point);
            
            const tooltip = this;
            const chart = tooltip.chart;

            // 确保只绑定一次事件
            if (!chart.tooltipClickHandler) {
                chart.tooltipClickHandler = function(e) {
                    // 检查tooltip是否显示
                    if (!tooltip.isHidden) {
                        const tooltipEl = tooltip.label && tooltip.label.element;
                        if (!tooltipEl) return;

                        // 获取tooltip元素的位置和大小
                        const tooltipRect = tooltipEl.getBoundingClientRect();
                        const chartRect = chart.container.getBoundingClientRect();

                        // 计算相对位置
                        const clickX = e.clientX - chartRect.left;
                        const clickY = e.clientY - chartRect.top;

                        // 检查点击是否在tooltip范围内
                        if (
                            clickX >= tooltipRect.left - chartRect.left &&
                            clickX <= tooltipRect.right - chartRect.left &&
                            clickY >= tooltipRect.top - chartRect.top &&
                            clickY <= tooltipRect.bottom - chartRect.top
                        ) {
                            // 获取当前tooltip数据
                            const points = Array.isArray(point) ? point : [point];
                            const tooltipContent = points.map(p =>
                                `Series: ${p.series.name}, X: ${p.x}, Y: ${p.y}`
                            ).join('\n');

                            // 发送消息
                            if (window.webkit?.messageHandlers?.tooltipClicked) {
                                window.webkit.messageHandlers.tooltipClicked.postMessage(tooltipContent);
                            }
                            console.log('Tooltip clicked:', tooltipContent);
                        }
                    }
                };

                // 绑定事件
                Highcharts.addEvent(chart.container, 'click', chart.tooltipClickHandler);
            }
        });
    */
    private func configureChartOptions() -> AAOptions {
        AAOptions()
            .chart(AAChart()
                .type(.areaspline)
                .events(AAChartEvents()
                    .load("""
                          function () {
                                  Highcharts.wrap(Highcharts.Tooltip.prototype, 'refresh', function(proceed, point) {
                                      proceed.call(this, point);
                                      
                                      const tooltip = this;
                                      const chart = tooltip.chart;

                                      if (!chart.tooltipClickHandler) {
                                          chart.tooltipClickHandler = function(e) {
                                              if (!tooltip.isHidden) {
                                                  const tooltipEl = tooltip.label && tooltip.label.element;
                                                  if (!tooltipEl) return;

                                                  const tooltipRect = tooltipEl.getBoundingClientRect();
                                                  const chartRect = chart.container.getBoundingClientRect();

                                                  const clickX = e.clientX - chartRect.left;
                                                  const clickY = e.clientY - chartRect.top;

                                                  if (
                                                      clickX >= tooltipRect.left - chartRect.left &&
                                                      clickX <= tooltipRect.right - chartRect.left &&
                                                      clickY >= tooltipRect.top - chartRect.top &&
                                                      clickY <= tooltipRect.bottom - chartRect.top
                                                  ) {
                                                      const points = Array.isArray(point) ? point : [point];
                                                      const tooltipContent = points.map(p =>
                                                          `Series: ${p.series.name}, X: ${p.x}, Y: ${p.y}`
                                                      ).join('\n');

                                                      if (window.webkit?.messageHandlers?.tooltipClicked) {
                                                          window.webkit.messageHandlers.tooltipClicked.postMessage(tooltipContent);
                                                      }
                                                      console.log('Tooltip clicked:', tooltipContent);
                                                  }
                                              }
                                          };

                                          Highcharts.addEvent(chart.container, 'click', chart.tooltipClickHandler);
                                      }
                                  });
                                  }
                              
                          """)))
            .xAxis(AAXAxis()
                .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]))
            .series([
                AASeriesElement()
                    .data([7.0, 6.9, 2.5, 14.5, 18.2, 21.5, 5.2, 26.5, 23.3, 45.3, 13.9, 9.6])
                    .marker(AAMarker()
                        .lineColor(AAColor.yellow)
                        .lineWidth(3)
                        .radius(10))
            ])
    }
}




extension CustomTooltipClickEventCallbackVC: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == kUserContentMessageNameTooltipClicked {
            if let messageBody = message.body as? String {
                // 处理 JavaScript 回调的信息
                print("Received \(kUserContentMessageNameTooltipClicked) message from JavaScript: \(messageBody)")
                
            }
        }
    }
}


extension CustomTooltipClickEventCallbackVC: AAChartViewDelegate {
    open func aaChartViewDidFinishLoad(_ aaChartView: AAChartView) {
       print("🚀🚀🚀, AAChartView Did Finished Load!!!")
    }
    
    open func aaChartView(_ aaChartView: AAChartView, clickEventMessage: AAClickEventMessageModel) {
        print(
            """
            
            clicked point series element name: \(clickEventMessage.name ?? "")
            🖱🖱🖱WARNING!!!!!!!!!!!!!!!!!!!! Click Event Message !!!!!!!!!!!!!!!!!!!! WARNING🖱🖱🖱
            ------------------------------------------------------------------------------------------
            user finger moved over!!!,get the move over event message: {
                category = \(String(describing: clickEventMessage.category))
                index = \(String(describing: clickEventMessage.index))
                name = \(String(describing: clickEventMessage.name))
                offset = \(String(describing: clickEventMessage.offset))
                x = \(String(describing: clickEventMessage.x))
                y = \(String(describing: clickEventMessage.y))
            }
            ------------------------------------------------------------------------------------------

            
            """
        )
    }

}
