"use strict";

(function (t) {
  var f;"undefined" !== typeof window ? f = window : "undefined" !== typeof self && (f = self);f.inViewport = t();
})(function () {
  return (function f(n, l, e) {
    function p(g, m) {
      if (!l[g]) {
        if (!n[g]) {
          var c = "function" == typeof require && require;if (!m && c) return c(g, !0);if (q) return q(g, !0);c = Error("Cannot find module '" + g + "'");throw (c.code = "MODULE_NOT_FOUND", c);
        }c = l[g] = { exports: {} };n[g][0].call(c.exports, function (e) {
          var c = n[g][1][e];return p(c ? c : e);
        }, c, c.exports, f, n, l, e);
      }return l[g].exports;
    }for (var q = "function" == typeof require && require, m = 0; m < e.length; m++) p(e[m]);return p;
  })({ 1: [function (f, n, l) {
      (function (e) {
        function f(b, a, h) {
          b.attachEvent ? b.attachEvent("on" + a, h) : b.addEventListener(a, h, !1);
        }function l(b, a, h) {
          var d;return function () {
            var k = this,
                e = arguments,
                w = h && !d;clearTimeout(d);d = setTimeout(function () {
              d = null;h || b.apply(k, e);
            }, a);w && b.apply(k, e);
          };
        }function m(b) {
          function a(b, a, e) {
            return { watch: function watch() {
                d.add(b, a, e);
              }, dispose: function dispose() {
                d.remove(b);
              } };
          }function h(a, d) {
            if (!(r(e.document.documentElement, a) && r(e.document.documentElement, b) && a.offsetWidth && a.offsetHeight)) return !1;var c = a.getBoundingClientRect(),
                k,
                h,
                g,
                f;b === e.document.body ? (k = -d, h = -d, g = e.document.documentElement.clientWidth + d, f = e.document.documentElement.clientHeight + d) : (f = b.getBoundingClientRect(), k = f.top - d, h = f.left - d, g = f.right + d, f = f.bottom + d);return c.right >= h && c.left <= g && c.bottom >= k && c.top <= f;
          }var d = g(),
              k = b === e.document.body ? e : b,
              c = l(d.checkAll(function (a, b, c) {
            h(a, b) && (d.remove(a), c(a));
          }), 15);f(k, "scroll", c);k === e && f(e, "resize", c);v && u(d, b, c);setInterval(c, 150);
          return { container: b, isInViewport: function isInViewport(d, b, c) {
              if (!c) return h(d, b);d = a(d, b, c);d.watch();return d;
            } };
        }function g() {
          function b(d) {
            for (var a = c.length - 1; 0 <= a; a--) if (c[a][0] === d) return a;return -1;
          }function a(a) {
            return -1 !== b(a);
          }var c = [];return { add: function add(d, b, e) {
              a(d) || c.push([d, b, e]);
            }, remove: function remove(a) {
              a = b(a);-1 !== a && c.splice(a, 1);
            }, isWatched: a, checkAll: function checkAll(a) {
              return function () {
                for (var b = c.length - 1; 0 <= b; b--) a.apply(this, c[b]);
              };
            } };
        }function u(b, a, c) {
          function d(a) {
            a = g.call([], Array.prototype.slice.call(a.addedNodes), a.target);return 0 < f.call(a, b.isWatched).length;
          }var e = new MutationObserver(function (a) {
            !0 === a.some(d) && setTimeout(c, 0);
          }),
              f = Array.prototype.filter,
              g = Array.prototype.concat;e.observe(a, { childList: !0, subtree: !0, attributes: !0 });
        }n.exports = function (b, a, f) {
          var d = e.document.body;if (void 0 === a || "function" === typeof a) f = a, a = {};d = a.container || d;a = a.offset || 0;for (var g = 0; g < c.length; g++) if (c[g].container === d) return c[g].isInViewport(b, a, f);return c[c.push(m(d)) - 1].isInViewport(b, a, f);
        };var c = [],
            v = "function" === typeof e.MutationObserver,
            r = e.document.documentElement.compareDocumentPosition ? function (b, a) {
          return !!(b.compareDocumentPosition(a) & 16);
        } : e.document.documentElement.contains ? function (b, a) {
          return b !== a && (b.contains ? b.contains(a) : !1);
        } : function (b, a) {
          for (; a = a.parentNode;) if (a === b) return !0;return !1;
        };
      }).call(this, "undefined" !== typeof global ? global : "undefined" !== typeof self ? self : "undefined" !== typeof window ? window : {});
    }, {}] }, {}, [1])(1);
});
'use strict';

$(document).ready(function () {
  $('.js-fancybox').fancybox({
    helpers: {
      overlay: {
        locked: false
      },
      media: {}
    }
  });
});
