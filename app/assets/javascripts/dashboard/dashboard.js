$(document).ready(function() {


    // Moris Charts - Line Charts
    Morris.Line({
        element: 'visits_chart',
        data: $('#visits_chart').data('views'),
            /*
            [
            { y: '2006', a: 50, b: 40 },
            { y: '2007', a: 65,  b: 55 },
            { y: '2008', a: 50,  b: 40 },
            { y: '2009', a: 75,  b: 65 },
            { y: '2010', a: 50,  b: 40 },
            { y: '2011', a: 75,  b: 65 },
            { y: '2012', a: 100, b: 90 }
        ],*/
        xkey: 'day',
        ykeys: ['total_views'],
        labels: ['Series A'],
        lineColors:['#0aa699']
    });

    Morris.Donut({
        element: 'referrer-breakdown',
        data: [
            {label: "Download Sales", value: 12},
            {label: "In-Store Sales", value: 30},
            {label: "Mail-Order Sales", value: 20}
        ],
        colors:['#60bfb6','#91cdec','#eceff1']
    });

    // Purchases by day for four weeks
    // Moris Charts - Line Charts
    Morris.Line({
        /*
        element: 'purchases_chart',
        data: $('#purchases_chart').data('purchases'),
        xkey: 'day',
        ykeys: ['total_purchases'],
        labels: ['Series A'],
        lineColors:['#0aa699']
        */
        element: 'purchases_chart',
        data: $('#purchases_chart').data('purchases'),
        xkey: 'y',
        ykeys: ['purchases'],
        labels: ['Total ticket purchases'],
        lineColors:['#0aa699']
    });


});