'use strict';

angular.module('urbanfunhunterApp')
  .controller('ExperiencesNewCtrl', function ($scope, newExperienceFactory) {

        // Text angular - Event Description text are -- end
        $scope.textAngularOpts = {
            textAngularEditors : {
                eventdescriptionTextArea: {
                    toolbar : [
                        {icon : "<i class='icon-code'></i>", name : "html", title : "Toggle Html"},
                        {icon : "h1", name : "h1", title : "H1"},
                        {icon : "h2", name : "h2", title : "H2"},
                        {icon : "pre", name : "pre", title : "Pre"},
                        {icon : "<i class='icon-bold'></i>", name : "b", title : "Bold"},
                        {icon : "<i class='icon-italic'></i>", name : "i", title : "Italics"},
                        {icon : "p", name : "p", title : "Paragraph"},
                        {icon : "<i class='icon-list-ul'></i>", name : "ul", title : "Unordered List"},
                        {icon : "<i class='icon-list-ol'></i>", name : "ol", title : "Ordered List"},
                        {icon : "<i class='icon-rotate-right'></i>", name : "redo", title : "Redo"},
                        {icon : "<i class='icon-undo'></i>", name : "undo", title : "Undo"},
                        {icon : "<i class='icon-ban-circle'></i>", name : "clear", title : "Clear"},
                        {icon : "<i class='icon-file'></i>", name : "insertImage", title : "Insert Image"},
                        {icon : "<i class='icon-html5'></i>", name : "insertHtml", title : "Insert Html"},
                        {icon : "<i class='icon-link'></i>", name : "createLink", title : "Create Link"}
                    ],
                    html : "<p>Enter the description of the event</p>",
                    disableStyle : false,
                    theme : {
                        editor : {
                            //"font-family" : "Roboto",
                            "font-size" : "1em",
                            "border-radius" : "4px",
                            "padding" : "11px",
                            "background" : "white",
                            "border" : "1px solid rgba(2,2,2,0.1)"
                        },
                        /*
                         toolbar: {
                         "background": "red",
                         "padding": "20px"
                         },
                         toolbarItems: {
                         "color" : "white",
                         "padding": "40px"
                         },*/
                        insertFormBtn : {
                            "background" : "red",
                            "color" : "white",
                            "padding" : "2px 3px",
                            "font-size" : "15px",
                            "margin-top" : "4px",
                            "border-radius" : "4px",
                            "font-family" : "Roboto",
                            "border" : "2px solid red"
                        }
                    }
                }
            }
        };
        // Text angular - Event Description text are -- end

        // Picture uploader -- start
        $scope.uploadFiles = function(){
            filepicker.pickAndStore({mimetype:'image/*', 'multiple': true},{},
                function(files){
                    console.log(files)
                    $scope.event_images = files;
                    console.log($scope.event_images);
                },
                function(err){
                    console.log(err)
                });
        };
        // Picture uploader -- end


        // Form submit -- start
        $scope.newEvent = function(data){

            var data = {'experience': {
                'name': $scope.eventName,
                'description': $scope.eventDescription,
                'price': $scope.eventPrice,
                'experience_date': $scope.eventDate,
                'experience_time': $scope.eventTime,
                'event_images': $scope.event_images
            }};
            console.log(data);
            // Todo: Show an animation while the form is being sent and the event is being created. Otherwise it looks like nothing is happening when the button is clicked.
            var newEvent = newExperienceFactory.save(data, function(callbackdata){
                console.log("The callback is" + callbackdata);
                console.log("The callback event is" + callbackdata.event);
                //$location.path('/events/' + callbackdata.id );
            });
        }
        // Form submit -- end

  });
