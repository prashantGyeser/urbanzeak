
$(function() {

    var d5 = [];
    for (var i = 0; i < 14; i += 0.5) {
    d5.push([i, Math.sqrt(i)]);
    }

var d6 = [];
for (var i = 0; i < 14; i += 0.5 + Math.random()) {
    d6.push([i, Math.sqrt(2*i + Math.sin(i) + 5)]);
    }

$.plot("#placeholder", [{
      data: d5,
      shadowSize: 0,
      lines: { show: true, lineWidth: 1 },
      points: { show: true, radius: 6 },
      color: '#f47238'
    },
      {
        data: d6,
        shadowSize: 0,
        lines: { show: true, lineWidth: 1 },
        points: { show: true, radius: 6 },
        color: '#00a9d4'
      }
    ],
            {
              grid: {borderWidth: 0, color: "#3d3d2c"}
            }
    );

  });


$(document).ready(function(){
var data = [
  { data: 19.5, color: "#f47238"},
  { data: 4.5, color: "#00a9d4"}
];

$.plot($("#stat1"), data,
        {
          series: {
            pie: {
              innerRadius: 0.7,
              show: true
            }
          }
        })

$.plot($("#stat2"), data,
        {
          series: {
            pie: {
              innerRadius: 0.7,
              show: true
            }
          }
        })

$.plot($("#stat3"), data,
        {
          series: {
            pie: {
              innerRadius: 0.7,
              show: true
            }
          }
        })
});
