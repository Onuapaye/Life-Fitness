jQuery(document).ready(function() {
    
    // This will empty first option in select to enable placeholder
    // jQuery('select option:first-child').text('');
    
    // Select2
    // jQuery("select").select2({
    //     minimumResultsForSearch: -1
    // });

    // Progress Wizard
    jQuery('#progressWizard').bootstrapWizard({
        
        onTabShow: function(tab, navigation, index) {
            tab.prevAll().addClass('done');
            tab.nextAll().removeClass('done');
            tab.removeClass('done');
            
             var $total_prog = navigation.find('li').length;
             var $current_prog = index + 1;
            
            if($current_prog >= $total_prog) {
                $('#progressWizard').find('.wizard .next').addClass('hide');
                $('#progressWizard').find('.wizard .finish').removeClass('hide');
            } else {
                $('#progressWizard').find('.wizard .next').removeClass('hide');
                $('#progressWizard').find('.wizard .finish').addClass('hide');
            }
            
            var $percent = ($current_prog/$total_prog) * 100;
            $('#progressWizard').find('.progress-bar').css('width', $percent+'%');
        },
		onTabClick: function(tab, navigation, index) {
            return false;
        },
		onNext: function(tab, navigation, index) {
            var $valid = jQuery('#progressWizard').valid();
            if (!$valid) {
                $validator_progress.focusInvalid();
                return false;
            }
        }
    });
    

    // Wizard With Form Validation
    jQuery('#valWizard').bootstrapWizard({
        onTabShow: function(tab, navigation, index) {
            tab.prevAll().addClass('done');
            tab.nextAll().removeClass('done');
            tab.removeClass('done');
            
            var $total = navigation.find('li').length;
            var $current = index + 1;
            
            if($current >= $total) {
                $('#valWizard').find('.wizard .next').addClass('hide');
                $('#valWizard').find('.wizard .finish').removeClass('hide');
            } else {
                $('#valWizard').find('.wizard .next').removeClass('hide');
                $('#valWizard').find('.wizard .finish').addClass('hide');
            }
        },
        onTabClick: function(tab, navigation, index) {
            return false;
        },
        onNext: function(tab, navigation, index) {
            var $valid = jQuery('#valWizard').valid();
            if (!$valid) {
                $validator.focusInvalid();
                return false;
            }
        }
    });
    
    // Wizard With Form Validation
    var $validator = jQuery("#valWizard").validate({
        highlight: function(element) {
            jQuery(element).closest('.form-group').removeClass('has-success').addClass('has-error');
        },
        success: function(element) {
            jQuery(element).closest('.form-group').removeClass('has-error');
        }
    });
    
	// Wizard With Form Validation for #progressWizard
    var $validator_progress = jQuery("#progressWizard").validate({
        highlight: function(element) {
            jQuery(element).closest('.form-group').removeClass('has-success').addClass('has-error');
        },
        success: function(element) {
            jQuery(element).closest('.form-group').removeClass('has-error');
        }
    });
	
    // This will submit the basicWizard form
    jQuery('.panel-wizard').submit(function() {    
        // alert('This will submit the form wizard');
        if (confirm('This will submit the form data. Are you sure?') == true) {
            return true
        } else {
            alert('Okay! Form data not submitted.')
            return false
        }
        // return false // remove this to submit to specified action url
    });

	// Validation with select boxes
	// jQuery("#flowers, #user_role_id").select2({
	// 	minimumResultsForSearch: -1
	// });

    $("tr").not(':first').hover(
      function () {
        $(this).css("background-color", rgb(1,51,52,0.8));
      }, 
      function () {
        $(this).css("background-color", rgb(255,102,0,0.8));
      }
    );

    // jQuery('#user_role_id').select2({
    //     minimumResultsForSearch: -1
    // });

});

