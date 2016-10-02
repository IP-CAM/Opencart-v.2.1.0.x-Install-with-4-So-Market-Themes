<?php
    echo $header;
    global $config;
	$template = $config->get('config_template');
	
	$str = strip_tags($content_block1);
	$str = preg_replace('/\s(?=\s)/', '', $str);
	$str = preg_replace('/[\n\r\t]/', '', $str);
	$str = str_replace(' ', '', $str);
	$str = trim($str, "\xC2\xA0\n");
			
?>
<?php $str = trim($content_top); ?>
<?php 
if (trim($content_top)) : ?>
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
<?php endif; ?>

<div class="container">
     <div class="row">
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-8 col-md-9 col-xs-12'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        
        <?php echo $column_left; ?>
        <div id="content" class="<?php echo $class; ?>">
            <?php echo $content_block2 ?>
            <?php echo $content_block3 ?>
			<?php echo $content_block4 ?>
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