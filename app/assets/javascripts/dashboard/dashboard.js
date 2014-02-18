$(document).ready(function() {

    alert(gon.page_views);

    // Moris Charts - Line Charts

    Morris.Line({
        element: 'line-example',
        data: [
            { y: '2006', a: 50, b: 40 },
            { y: '2007', a: 65,  b: 55 },
            { y: '2008', a: 50,  b: 40 },
            { y: '2009', a: 75,  b: 65 },
            { y: '2010', a: 50,  b: 40 },
            { y: '2011', a: 75,  b: 65 },
            { y: '2012', a: 100, b: 90 }
        ],
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Series A', 'Series B'],
        lineColors:['#0aa699','#d1dade']
    });

    Morris.Line({
        element: 'most_valuable_referrer_1',
        data: [
            { y: '2006', a: 50, b: 40 },
            { y: '2007', a: 65,  b: 55 },
            { y: '2008', a: 50,  b: 40 },
            { y: '2009', a: 75,  b: 65 },
            { y: '2010', a: 50,  b: 40 },
            { y: '2011', a: 75,  b: 65 },
            { y: '2012', a: 100, b: 90 }
        ],
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Series A', 'Series B'],
        lineColors:['#0aa699','#d1dade']
    });

    Morris.Line({
        element: 'most_valuable_referrer_2',
        data: [
            { y: '2006', a: 50, b: 40 },
            { y: '2007', a: 65,  b: 55 },
            { y: '2008', a: 50,  b: 40 },
            { y: '2009', a: 75,  b: 65 },
            { y: '2010', a: 50,  b: 40 },
            { y: '2011', a: 75,  b: 65 },
            { y: '2012', a: 100, b: 90 }
        ],
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Series A', 'Series B'],
        lineColors:['#0aa699','#d1dade']
    });

    Morris.Line({
        element: 'most_valuable_referrer_3',
        data: [
            { y: '2006', a: 50, b: 40 },
            { y: '2007', a: 65,  b: 55 },
            { y: '2008', a: 50,  b: 40 },
            { y: '2009', a: 75,  b: 65 },
            { y: '2010', a: 50,  b: 40 },
            { y: '2011', a: 75,  b: 65 },
            { y: '2012', a: 100, b: 90 }
        ],
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Series A', 'Series B'],
        lineColors:['#0aa699','#d1dade'],
    });

});