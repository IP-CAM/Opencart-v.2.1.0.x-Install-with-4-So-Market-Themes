<?php
    echo $header; 
    global $config;
    $lang = $config->get('config_language_id');
	
	$str = strip_tags($content_block1);
	$str = preg_replace('/\s(?=\s)/', '', $str);
	$str = preg_replace('/[\n\r\t]/', '', $str);
	$str = str_replace(' ', '', $str);
	$str = trim($str, "\xC2\xA0\n");
?>

<section class="so-spotlight1 ">
    <div class="container">
        <div class="row">
            <div id="yt_header_right" class="<?php  echo (isset($str) && !empty($str)) ? 'col-lg-offset-3 col-lg-9 col-md-12' : 'col-xs-12' ;?>">
                 <div class="slider-container " > 
                    <?php echo $content_top; ?>
                </div>
            </div>
        </div>
    </div>
</section>

<?php if ($content_block2) { ?>
    <?php $class = 'col-md-9 col-sm-12 col-xs-12'; ?>
    <?php } else { ?>
    <?php $class = 'col-xs-12'; ?>
<?php } 
if (trim($content_block3)) :?>
<section class="so-spotlight2">
    <div class="container">
        <div class="row">
            <?php if ($content_block2) : ?>
            <div class="news-letter col-md-3 col-sm-12 col-xs-12">
                <?php echo $content_block2 ?>
            </div>
            <?php endif; ?>
            
            <?php if ($content_block3) : ?>
              <div class="banner-html <?php echo $class; ?>">
                  <?php echo $content_block3 ?>
              </div>
            <?php endif; ?>
        </div>
    </div>
</section>
<?php endif; ?>

<div class="container">
  <div class="row">
	<?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-md-9 col-sm-8 col-xs-12'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      
        <?php if ($content_block4) : ?>
            <?php echo $content_block4 ?> 
        <?php endif; ?>
    </div>
    <?php echo $column_right; ?>
	</div>
</div>

<?php if (trim($content_bottom)) : ?>
<section class="so-spotlight3">
    <div class="container">
        <div class="row">
            <?php echo $content_bottom ?>
        </div>
    </div> 
</section>
<?php endif; ?>

<?php echo $footer; ?>