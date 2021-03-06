<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <title>gallery filters - Bootsnipp.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        .work {
  padding-bottom: 40px;
  margin-top: 60px;
}
.work * {
  box-sizing: border-box;
}
.work .category-buttons {
  text-align: center;
  margin: 0 0 60px 0;
}
@media (max-width: 610px) {
  .work .category-buttons {
    margin: 0 0 30px 0;
  }
  .work .category-buttons a {
    display: inline-block;
    width: 46%;
    padding: 12px 10px !important;
    margin: 1.5% 1% !important;
  }
  .work .category-buttons a:nth-child(even) {
    margin-right: 0;
  }
  .work .category-buttons a:nth-child(odd) {
    margin-left: 0;
  }
}
@media (min-width: 611px) {
  .work .category-buttons a:first-child {
    margin-left: 0;
  }
  .work .category-buttons a:last-child {
    margin-right: 0;
  }
}
.work .category-buttons a {
  color: #9A9A9A;
  text-decoration: none;
  padding: 9px 15px;
  border: 1px solid #9A9A9A;
  margin: 0 10px;
  cursor: pointer;
}
.work .category-buttons a.active {
  color: #373B3D;
  border: 1px solid #373B3D;
}
.work .grid {
  margin-top: 40px;
  width: 100%;
  max-width: 960px;
  margin: 0 auto;
  position: relative;
  -webkit-transition: all 750ms cubic-bezier(1, 0, 0, 1);
  transition: all 750ms cubic-bezier(1, 0, 0, 1);
}
@media (max-width: 960px) {
  .work .grid {
    width: 700px;
  }
}
@media (max-width: 720px) {
  .work .grid {
    width: 100%;
  }
}
.work .grid .animating {
  -webkit-transition: all 750ms cubic-bezier(0.175, 0.885, 0.32, 1.1);
  transition: all 750ms cubic-bezier(0.175, 0.885, 0.32, 1.1);
}
.work .grid .setScale {
  -webkit-transform: scale(1);
  -ms-transform: scale(1);
  transform: scale(1);
}
.work .grid .show {
  -webkit-transform: scale(1);
  -ms-transform: scale(1);
  transform: scale(1);
  opacity: 1;
}
.work .card {
  background: #fff;
  display: block;
  text-decoration: none;
  color: #2b2b2b;
  width: 32%;
  box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.1), 0 1px 5px rgba(0, 0, 0, 0.15);
  transform-origin: center center;
  -webkit-transform: translateZ(0);
  -moz-transform: translateZ(0);
  -ms-transform: translateZ(0);
  -o-transform: translateZ(0);
  transform: translateZ(0);
  -webkit-transform: scale(0);
  -ms-transform: scale(0);
  transform: scale(0);
  opacity: 0;
}
@media (max-width: 700px) {
  .work .card {
    width: 49.25%;
  }
}
@media (max-width: 480px) {
  .work .card {
    width: 100%;
  }
}
.work .card img {
  display: block;
  width: 100%;
}
.work .card .title {
  padding: 10px;
  color: #2b2b2b;
}
.work .guide {
  width: 32%;
  position: absolute;
  left: 0;
  top: 0;
  z-index: -1000;
}
@media (max-width: 700px) {
  .work .guide {
    width: 49.25%;
  }
}
@media (max-width: 480px) {
  .work .guide {
    width: 100%;
  }
}




	
/* rows---------- */
 /*----------------------------*/
       .vertical-divider {
  position: absolute;
  z-index: 10;
  top: 50%;
  left: 50%;
  margin: 0;
  padding: 0;
  width: auto;
  height: 10%;
  line-height: 0;
  text-align:center;
  text-transform: uppercase;
  transform: translateX(-50%);
}

.vertical-divider:before, 
.vertical-divider:after {
  position: absolute;
  left: 50%;
  content: '';
  z-index: 9;
  border-left: 1px solid rgba(34,36,38,.15);
  border-right: 1px solid rgba(255,255,255,.1);
  width: 0;
  height: calc(100% - 1rem);
}

.row-divided > .vertical-divider {
  height: calc(50% - 1rem);    
}

.vertical-divider:before {
  top: -100%;
}

.vertical-divider:after {
  top: auto;
  bottom: 0;
}

.row-divided {
  position:relative;
}

.row-divided > [class^="col-"],
.row-divided > [class*=" col-"] {
  padding-left: 30px;  /* gutter width (give a little extra room) 2x default */
  padding-right: 30px; /* gutter width (give a little extra room) 2x default */
}            	
  

/* 사람 Carousel */
#quote-carousel {
    padding: 0 10px 30px 10px;
    margin-top: 30px;
    /* Control buttons  */
    /* Previous button  */
    /* Next button  */
    /* Changes the position of the indicators */
    /* Changes the color of the indicators */
}
#quote-carousel .carousel-control {
    background: none;
    color: #CACACA;
    font-size: 2.3em;
    text-shadow: none;
    margin-top: 30px;
}
#quote-carousel .carousel-control.left {
    left: -60px;
    color: white;
}
#quote-carousel .carousel-control.right {
    right: -60px;
    color: white;
}
#quote-carousel .carousel-indicators {
    right: 50%;
    top: auto;
    bottom: 0px;
    margin-right: -19px;
}
#quote-carousel .carousel-indicators li {
    width: 50px;
    height: 50px;
    margin: 5px;
    cursor: pointer;
    border: 4px solid #CCC;
    border-radius: 50px;
    opacity: 0.4;
    overflow: hidden;
    transition: all 0.4s;
}
#quote-carousel .carousel-indicators .active {
    background: #333333;
    width: 128px;
    height: 128px;
    border-radius: 100px;
    border-color: #f33;
    opacity: 1;
    overflow: hidden;
}
.carousel-inner {
    min-height: 300px;
}
.item blockquote {
    border-left: none;
    margin: 0;
}
.item blockquote p:before {
    content: "\f10d";
    font-family: 'Fontawesome';
    float: left;
    margin-right: 10px;
}


    </style>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
</head>
<body>

<script type="text/javascript">

$(document).ready(function() {
	
	$(window).scroll(function() {
		if ($(this).scrollTop() > 200) {
			$('.top').fadeIn();
		} else {
			$('.top').fadeOut();
		}
	});
	$('.top').click(function() {
		$('html, body').animate({
			scrollTop : 0
		}, 400);
		return false;
	});
});
   </script>
    
<script type="text/javascript">
$(document).ready(function() {
  var projects = $('.card');
  var filteredProjects = [];
  var selection = "all";
  var running = false;
  window.setTimeout(function() {
    $('.all').trigger('click');
  }, 150);

  $(window).resize(function() {
    buildGrid(filteredProjects);
  });

  $('.category-buttons a').on('click', function(e) {
    e.preventDefault();
    if (!running) {
      running = true;
      selection = $(this).data('group');
      $('.category-buttons a').removeClass('active');
      $(this).addClass('active');
      filteredProjects = [];
      for (i = 0; i < projects.length; i++) {
        var project = projects[i];
        var dataString = $(project).data('groups');
        var dataArray = dataString.split(',');
        dataArray.pop();
        if (selection === 'all') {
          $(project).addClass('setScale').queue(function(next) {
            filteredProjects.push(project);
            next();
          }).queue(function(next) {
            $(this).removeClass('setScale');
            next();
          }).queue(function(next) {
            $(this).addClass('animating show')
            next();
          }).delay(750).queue(function() {
            running = false;
            $(this).removeClass('animating').dequeue();
          });
        } else {
          if ($.inArray(selection, dataArray) > -1) {
            $(project).addClass('setScale').queue(function(next) {
              filteredProjects.push(project);
              next();
            }).queue(function(next) {
              $(this).removeClass('setScale');
              next();
            }).queue(function(next) {
              $(this).addClass('animating show')
              next();
            }).delay(750).queue(function() {
              running = false;
              $(this).removeClass('animating').dequeue();
            });
            /*$(project).css({
              '-webkit-transition': 'all 750ms cubic-bezier(0.175, 0.885, 0.32, 1.1)',
              'transition': 'all 750ms cubic-bezier(0.175, 0.885, 0.32, 1.1);',
              '-webkit-transform': 'scale(' + 1 + ')',
              '-ms-transform': 'scale(' + 1 + ')',
              'transform': 'scale(' + 1 + ')',
              'opacity': 1
            });*/
          } else {
            $(project).queue(function(next) {
              $(this).addClass('animating');
              next();
            }).queue(function(next) {
              $(this).removeClass('show');
              next();
            }).delay(750).queue(function() {
              $(this).removeClass('animating').dequeue();
            });

            /*$(project).css({
              '-webkit-transition': 'all 750ms cubic-bezier(0.175, 0.885, 0.32, 1.1)',
              'transition': 'all 750ms cubic-bezier(0.175, 0.885, 0.32, 1.1);',
              '-webkit-transform': 'scale(' + 0 + ')',
              '-webkit-transform': 'scale(' + 0 + ')',
              '-ms-transform': 'scale(' + 0 + ')',
              'transform': 'scale(' + 0 + ')',
              'opacity': 0
            });*/
          }
        }
      }
      buildGrid(filteredProjects);
    }
  })

  function buildGrid(projects) {
    var left = 0;
    var top = 0;
    var totalHeight = 0;
    var largest = 0;
    var heights = [];
    for (i = 0; i < projects.length; i++) {
      $(projects[i]).css({
        height: 'auto'
      });
      heights.push($(projects[i]).height());
    }
    var maxIndex = 0;
    var maxHeight = 0;

    for (i = 0; i <= heights.length; i++) {
      if (heights[i] > maxHeight) {
        maxHeight = heights[i];
        maxIndex = i;
        $('.guide').height(maxHeight);
      }
      if (i === heights.length) {
        for (i = 0; i < projects.length; i++) {
          $(projects[i]).css({
            position: 'absolute',
            left: left + '%',
            top: top
          });
          left = left + ($('.guide').width() / $('#grid').width() * 100) + 2;

          if (i === maxIndex) {
            $(projects[i]).css({
              height: 'auto'
            });
          } else {
            $(projects[i]).css({
              height: maxHeight
            });
          }
          if ((i + 1) % 3 === 0 && projects.length > 3 && $(window).width() >= 700) {
            top = top + $('.guide').height() + 20;
            left = 0;
            totalHeight = totalHeight + $('.guide').height() + 20;

          } else if ((i + 1) % 2 === 0 && projects.length > 2 && $(window).width() < 700 && $(window).width() >= 480) {
            top = top + $('.guide').height() + 20;
            left = 0;
            totalHeight = totalHeight + $('.guide').height() + 20;

          } else if ((i + 1) % 1 === 0 && projects.length > 1 && $(window).width() < 480) {
            top = top + $('.guide').height() + 20;
            left = 0;
            totalHeight = totalHeight + $('.guide').height() + 20;
          }
          $('#grid').height(totalHeight + $('.guide').height());
        }
      }
    }
  }
})
</script>
</body>
</html>