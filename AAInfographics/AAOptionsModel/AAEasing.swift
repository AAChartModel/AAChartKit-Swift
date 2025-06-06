//
//  AAEasing.swift
//  AAInfographics
//
//  Created by AnAn on 2025/6/6.
//  Copyright © 2025 An An. All rights reserved.
//

import UIKit
import JavaScriptCore

/// Easing function from https://github.com/danro/easing-js/blob/master/easing.js
class AAEasing: NSObject {
/*
// --------------------------------------------------
// easing.js v0.5.4
// Generic set of easing functions with AMD support
// https://github.com/danro/easing-js
// This code may be freely distributed under the MIT license
// http://danro.mit-license.org/
// --------------------------------------------------
// All functions adapted from Thomas Fuchs & Jeremy Kahn
// Easing Equations (c) 2003 Robert Penner, BSD license
// https://raw.github.com/danro/easing-js/master/LICENSE
// --------------------------------------------------
(function (name, definition) {
  /*global define module*/
  if (typeof define == 'function') define(definition);
  else if (typeof module != 'undefined') module.exports = definition;
  else this[name] = definition;
}('easing', {
  easeInQuad: function(pos) {
    return Math.pow(pos, 2);
  },

  easeOutQuad: function(pos) {
    return -(Math.pow((pos-1), 2) -1);
  },

  easeInOutQuad: function(pos) {
    if ((pos/=0.5) < 1) return 0.5*Math.pow(pos,2);
    return -0.5 * ((pos-=2)*pos - 2);
  },

  easeInCubic: function(pos) {
    return Math.pow(pos, 3);
  },

  easeOutCubic: function(pos) {
    return (Math.pow((pos-1), 3) +1);
  },

  easeInOutCubic: function(pos) {
    if ((pos/=0.5) < 1) return 0.5*Math.pow(pos,3);
    return 0.5 * (Math.pow((pos-2),3) + 2);
  },

  easeInQuart: function(pos) {
    return Math.pow(pos, 4);
  },

  easeOutQuart: function(pos) {
    return -(Math.pow((pos-1), 4) -1);
  },

  easeInOutQuart: function(pos) {
    if ((pos/=0.5) < 1) return 0.5*Math.pow(pos,4);
    return -0.5 * ((pos-=2)*Math.pow(pos,3) - 2);
  },

  easeInQuint: function(pos) {
    return Math.pow(pos, 5);
  },

  easeOutQuint: function(pos) {
    return (Math.pow((pos-1), 5) +1);
  },

  easeInOutQuint: function(pos) {
    if ((pos/=0.5) < 1) return 0.5*Math.pow(pos,5);
    return 0.5 * (Math.pow((pos-2),5) + 2);
  },

  easeInSine: function(pos) {
    return -Math.cos(pos * (Math.PI/2)) + 1;
  },

  easeOutSine: function(pos) {
    return Math.sin(pos * (Math.PI/2));
  },

  easeInOutSine: function(pos) {
    return (-0.5 * (Math.cos(Math.PI*pos) -1));
  },

  easeInExpo: function(pos) {
    return (pos===0) ? 0 : Math.pow(2, 10 * (pos - 1));
  },

  easeOutExpo: function(pos) {
    return (pos===1) ? 1 : -Math.pow(2, -10 * pos) + 1;
  },

  easeInOutExpo: function(pos) {
    if(pos===0) return 0;
    if(pos===1) return 1;
    if((pos/=0.5) < 1) return 0.5 * Math.pow(2,10 * (pos-1));
    return 0.5 * (-Math.pow(2, -10 * --pos) + 2);
  },

  easeInCirc: function(pos) {
    return -(Math.sqrt(1 - (pos*pos)) - 1);
  },

  easeOutCirc: function(pos) {
    return Math.sqrt(1 - Math.pow((pos-1), 2));
  },

  easeInOutCirc: function(pos) {
    if((pos/=0.5) < 1) return -0.5 * (Math.sqrt(1 - pos*pos) - 1);
    return 0.5 * (Math.sqrt(1 - (pos-=2)*pos) + 1);
  },

  easeOutBounce: function(pos) {
    if ((pos) < (1/2.75)) {
      return (7.5625*pos*pos);
    } else if (pos < (2/2.75)) {
      return (7.5625*(pos-=(1.5/2.75))*pos + 0.75);
    } else if (pos < (2.5/2.75)) {
      return (7.5625*(pos-=(2.25/2.75))*pos + 0.9375);
    } else {
      return (7.5625*(pos-=(2.625/2.75))*pos + 0.984375);
    }
  },

  easeInBack: function(pos) {
    var s = 1.70158;
    return (pos)*pos*((s+1)*pos - s);
  },

  easeOutBack: function(pos) {
    var s = 1.70158;
    return (pos=pos-1)*pos*((s+1)*pos + s) + 1;
  },

  easeInOutBack: function(pos) {
    var s = 1.70158;
    if((pos/=0.5) < 1) return 0.5*(pos*pos*(((s*=(1.525))+1)*pos -s));
    return 0.5*((pos-=2)*pos*(((s*=(1.525))+1)*pos +s) +2);
  },

  elastic: function(pos) {
    return -1 * Math.pow(4,-8*pos) * Math.sin((pos*6-1)*(2*Math.PI)/2) + 1;
  },

  swingFromTo: function(pos) {
    var s = 1.70158;
    return ((pos/=0.5) < 1) ? 0.5*(pos*pos*(((s*=(1.525))+1)*pos - s)) :
    0.5*((pos-=2)*pos*(((s*=(1.525))+1)*pos + s) + 2);
  },

  swingFrom: function(pos) {
    var s = 1.70158;
    return pos*pos*((s+1)*pos - s);
  },

  swingTo: function(pos) {
    var s = 1.70158;
    return (pos-=1)*pos*((s+1)*pos + s) + 1;
  },

  bounce: function(pos) {
    if (pos < (1/2.75)) {
      return (7.5625*pos*pos);
    } else if (pos < (2/2.75)) {
      return (7.5625*(pos-=(1.5/2.75))*pos + 0.75);
    } else if (pos < (2.5/2.75)) {
      return (7.5625*(pos-=(2.25/2.75))*pos + 0.9375);
    } else {
      return (7.5625*(pos-=(2.625/2.75))*pos + 0.984375);
    }
  },

  bouncePast: function(pos) {
    if (pos < (1/2.75)) {
      return (7.5625*pos*pos);
    } else if (pos < (2/2.75)) {
      return 2 - (7.5625*(pos-=(1.5/2.75))*pos + 0.75);
    } else if (pos < (2.5/2.75)) {
      return 2 - (7.5625*(pos-=(2.25/2.75))*pos + 0.9375);
    } else {
      return 2 - (7.5625*(pos-=(2.625/2.75))*pos + 0.984375);
    }
  },

  easeFromTo: function(pos) {
    if ((pos/=0.5) < 1) return 0.5*Math.pow(pos,4);
    return -0.5 * ((pos-=2)*Math.pow(pos,3) - 2);
  },

  easeFrom: function(pos) {
    return Math.pow(pos,4);
  },

  easeTo: function(pos) {
    return Math.pow(pos,0.25);
  }
}));
*/
    /// Configure the chart animation easing type
    /// - Parameter easingType: The easing type as a string
    /// - Returns: The configured easing type as a string
    
  class func configureChartAnimationEasingType(easingType: String) -> String {
        switch easingType {
        case "easeInQuad":
            return """
            function(pos) {
                return Math.pow(pos, 2);
            }
            """
        case "easeOutQuad":
            return """
            function(pos) {
                return -(Math.pow((pos-1), 2) -1);
            }
            """
        case "easeInOutQuad":
            return """
            function(pos) {
                if ((pos/=0.5) < 1) return 0.5*Math.pow(pos,2);
                return -0.5 * ((pos-=2)*pos - 2);
            }
            """
        case "easeInCubic":
            return """
            function(pos) {
                return Math.pow(pos, 3);
            }
            """
        case "easeOutCubic":
            return """
            function(pos) {
                return (Math.pow((pos-1), 3) +1);
            }
            """
        case "easeInOutCubic":
            return """
            function(pos) {
                if ((pos/=0.5) < 1) return 0.5*Math.pow(pos,3);
                return 0.5 * (Math.pow((pos-2),3) + 2);
            }
            """
        case "easeInQuart":
            return """
            function(pos) {
                return Math.pow(pos, 4);
            }
            """
        case "easeOutQuart":
            return """
            function(pos) {
                return -(Math.pow((pos-1), 4) -1);
            }
            """
        case "easeInOutQuart":
            return """
            function(pos) {
                if ((pos/=0.5) < 1) return 0.5*Math.pow(pos,4);
                return -0.5 * ((pos-=2)*Math.pow(pos,3) - 2);
            }
            """
        case "easeInQuint":
            return """
            function(pos) {
                return Math.pow(pos, 5);
            }
            """
        case "easeOutQuint":
            return """
            function(pos) {
                return (Math.pow((pos-1), 5) +1);
            }
            """
        case "easeInOutQuint":
            return """
            function(pos) {
                if ((pos/=0.5) < 1) return 0.5*Math.pow(pos,5);
                return 0.5 * (Math.pow((pos-2),5) + 2);
            }
            """
        case "easeInSine":
            return """
            function(pos) {
                return -Math.cos(pos * (Math.PI/2)) + 1;
            }
            """
        case "easeOutSine":
            return """
            function(pos) {
                return Math.sin(pos * (Math.PI/2));
            }
            """
        case "easeInOutSine":
            return """
            function(pos) {
                return (-0.5 * (Math.cos(Math.PI*pos) -1));
            }
            """
        case "easeInExpo":
            return """
            function(pos) {
                return (pos===0) ? 0 : Math.pow(2, 10 * (pos - 1));
            }
            """
        case "easeOutExpo":
            return """
            function(pos) {
                return (pos===1) ? 1 : -Math.pow(2, -10 * pos) + 1;
            }
            """
        case "easeInOutExpo":
            return """
            function(pos) {
                if(pos===0) return 0;
                if(pos===1) return 1;
                if((pos/=0.5) < 1) return 0.5 * Math.pow(2,10 * (pos-1));
                return 0.5 * (-Math.pow(2, -10 * --pos) + 2);
            }
            """
        case "easeInCirc":
            return """
            function(pos) {
                return -(Math.sqrt(1 - (pos*pos)) - 1);
            }
            """
        case "easeOutCirc":
            return """
            function(pos) {
                return Math.sqrt(1 - Math.pow((pos-1), 2));
            }
            """
        case "easeInOutCirc":
            return """
            function(pos) {
                if((pos/=0.5) < 1) return -0.5 * (Math.sqrt(1 - pos*pos) - 1);
                return 0.5 * (Math.sqrt(1 - (pos-=2)*pos) + 1);
            }
            """
        case "easeOutBounce":
            return """
            function(pos) {
                if ((pos) < (1/2.75)) {
                    return (7.5625*pos*pos);
                } else if (pos < (2/2.75)) {
                    return (7.5625*(pos-=(1.5/2.75))*pos + 0.75);
                } else if (pos < (2.5/2.75)) {
                    return (7.5625*(pos-=(2.25/2.75))*pos + 0.9375);
                } else {
                    return (7.5625*(pos-=(2.625/2.75))*pos + 0.984375);
                }
            }
            """
        case "easeInBack":
            return """
            function(pos) {
                var s = 1.70158;
                return (pos)*pos*((s+1)*pos - s);
            }
            """
        case "easeOutBack":
            return """
            function(pos) {
                var s = 1.70158;
                return (pos=pos-1)*pos*((s+1)*pos + s) + 1;
            }
            """
        case "easeInOutBack":
            return """
            function(pos) {
                var s = 1.70158;
                if((pos/=0.5) < 1) return 0.5*(pos*pos*(((s*=(1.525))+1)*pos -s));
                return 0.5*((pos-=2)*pos*(((s*=(1.525))+1)*pos +s) +2);
            }
            """
        case "elastic":
            return """
            function(pos) {
                return -1 * Math.pow(4,-8*pos) * Math.sin((pos*6-1)*(2*Math.PI)/2) + 1;
            }
            """
        case "swingFromTo":
            return """
            function(pos) {
                var s = 1.70158;
                return ((pos/=0.5) < 1) ? 0.5*(pos*pos*(((s*=(1.525))+1)*pos - s)) :
                0.5*((pos-=2)*pos*(((s*=(1.525))+1)*pos + s) + 2);
            }
            """
        case "swingFrom":
            return """
            function(pos) {
                var s = 1.70158;
                return pos*pos*((s+1)*pos - s);
            }
            """
        case "swingTo":
            return """
            function(pos) {
                var s = 1.70158;
                return (pos-=1)*pos*((s+1)*pos + s) + 1;
            }
            """
        case "bounce":
            return """
            function(pos) {
                if (pos < (1/2.75)) {
                    return (7.5625*pos*pos);
                } else if (pos < (2/2.75)) {
                    return (7.5625*(pos-=(1.5/2.75))*pos + 0.75);
                } else if (pos < (2.5/2.75)) {
                    return (7.5625*(pos-=(2.25/2.75))*pos + 0.9375);
                } else {
                    return (7.5625*(pos-=(2.625/2.75))*pos + 0.984375);
                }
            }
            """
        case "bouncePast":
            return """
            function(pos) {
                if (pos < (1/2.75)) {
                    return (7.5625*pos*pos);
                } else if (pos < (2/2.75)) {
                    return 2 - (7.5625*(pos-=(1.5/2.75))*pos + 0.75);
                } else if (pos < (2.5/2.75)) {
                    return 2 - (7.5625*(pos-=(2.25/2.75))*pos + 0.9375);
                } else {
                    return 2 - (7.5625*(pos-=(2.625/2.75))*pos + 0.984375);
                }
            }
            """
        case "easeFromTo":
            return """
            function(pos) {
                if ((pos/=0.5) < 1) return 0.5*Math.pow(pos,4);
                return -0.5 * ((pos-=2)*Math.pow(pos,3) - 2);
            }
            """
        case "easeFrom":
            return """
            function(pos) {
                return Math.pow(pos,4);
            }
            """
        case "easeTo":
            return """
            function(pos) {
                return Math.pow(pos,0.25);
            }
            """
        default:
            return """
            function(pos) {
                if ((pos/=0.5) < 1) return 0.5*Math.pow(pos,2);
                return -0.5 * ((pos-=2)*pos - 2);
            }
            """
        }
  }


}
