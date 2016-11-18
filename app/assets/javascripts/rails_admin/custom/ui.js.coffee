jQuery ->
	toggle_column = (col) ->
	  $(col + '_toggle').toggle();
	  if $(col + '_label').hasClass('label-success')
	    $(col + '_label').removeClass('label-success')
	    $(col + '_label').addClass('label-default')
	    true
	  else
	    $(col + '_label').addClass('label-success')
	    $(col + '_label').removeClass('label-default')
	    true
	$(".alert" ).fadeOut(5000);
