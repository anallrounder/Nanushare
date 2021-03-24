(function($) {

	jQuery.fn.progressBar = function( options ) {

		//Default values for progress_bar
		var defaults = {
			height : "80",
			backgroundColor : "#272625",
			barColor : "#ffb607",
			targetBarColor : "",
			percentage : true,
			shadow : false,
			border : false,
			animation : false,
			animateTarget : false,
		};

		var settings = $.extend( {}, defaults, options );

		return this.each( function() {
			var elem = $( this );
			$.fn.replaceProgressBar( elem, settings );
		});
	};

	$.fn.replaceProgressBar = function( item, settings ) {
		var skill		= item.text();
		var progress	= item.data( 'width' );
		var target		= item.data ( 'target' );
		var bar_classes = ' ';
		var animation_class = '';
		var bar_styles	= 'background-color:' + settings.backgroundColor + ';height:' + settings.height + 'px;';
		if ( settings.shadow ) { bar_classes += 'shadow'; }
		if ( settings.border ) { bar_classes += ' border'; }
		if ( settings.animation ) { animation_class = ' animate'; }

		var overlay = '<div class="progressbar' + animation_class + '" data-width="' + progress + '">';
		overlay += '<p class="title">' + skill + '</p>';
		overlay += '<div class="bar-container' + bar_classes + '" style="' + bar_styles + '">';

		// Render the progress bar background
		overlay += '<span class="backgroundBar"></span>';

		// Display target bar only if set
		if ( target ) {
			if ( settings.animateTarget ) {
				overlay += '<span class="targetBar loader" style="width:' + target + '%;background-color:' + settings.targetBarColor + ';"></span>';
			}
			else {
				overlay += '<span class="targetBar" style="width:' + target + '%;background-color:' + settings.targetBarColor + ';"></span>';
			}
		}

		// Render the progress bar
		// 메인에서 수치 % 빼고 사용
		if ( settings.animation ) {
			overlay += '<span class="bar" style="background-color:' + settings.barColor + ';"><span class="progress-percent" style="line-height:' + settings.height + 'px;">' + '</span></span>';
		}
	
		else {
			overlay += '<span class="bar" style="width:' + progress + '%;background-color:' + settings.barColor + ';"></span>';
		}

		// Render the percentage if enabled
		if ( settings.percentage ) {
			overlay += '';
		}

		// End
		overlay += '</div></div>';

		// Render the progress bar on the page
		$( item ).replaceWith( overlay );

	};

	var animate = function() {

		var doc_height = $(window).height();

		// for 문
		$( '.progressbar.animate' ).each( function() {
			var position = $( this ).offset().top; // .offset()은 선택한 요소의 좌표를 가져오거나 특정 좌표로 이동시킴

			if ( ( $(window).scrollTop() + doc_height - 60 ) > position ) {
				var progress = $( this ).data( 'width' ) + "%";

				$( this ).removeClass( 'animate' );
				$( this ).find( '.bar' ).css('opacity', '0.1');

				$( this ).find( '.bar' ).animate({
					width : progress,
					opacity : 1
				}, 3000 );
			}

		});

	};
/*
	// Looking for an animation element in the view
	$(document).ready(function() {

		if ( $( '.progressbar.animate' ).length < 1 ) {
			return;
		}

		// If there is an animate element visible on the page, trigger the animation
		animate();

	});
*/
	/*
	document 가 ready가 됐을때 

	.tab-pane 얘가 hasClass('active') -> animate 
  		-> result : 처음에 보여주는 day progress bar가 실행됨
	*/

	
	$(document).ready(function() {
	
		var tab = $('.tab-pane.active').find('.progressbar.animate');
		console.log(tab);
		
		var doc_height = $(window).height();
		var position = tab.offset().top; // .offset()은 선택한 요소의 좌표를 가져오거나 특정 좌표로 이동시킴
		if ( ( $(window).scrollTop() + doc_height - 60 ) > position ) {
			var progress = tab.data( 'width' ) + "%";

			tab.removeClass( 'animate' );
			tab.find( '.bar' ).css('opacity', '0.1');

			tab.find( '.bar' ).animate({
				width : progress,
				opacity : 1
			}, 3000 );
		}
	});
	
	
	var animateTemp = function() {

		var doc_height = $(window).height();

		$( '.progressbar.animate' ).each( function() {
			var position = $( this ).offset().top; // .offset()은 선택한 요소의 좌표를 가져오거나 특정 좌표로 이동시킴

			if ( ( $(window).scrollTop() + doc_height - 60 ) > position ) {
				var progress = $( this ).data( 'width' ) + "%";

				$( this ).removeClass( 'animate' );
				$( this ).find( '.bar' ).css('opacity', '0.1');

				$( this ).find( '.bar' ).animate({
					width : progress,
					opacity : 1
				}, 3000 );
			}

		});

	};
	
	



})(jQuery);
