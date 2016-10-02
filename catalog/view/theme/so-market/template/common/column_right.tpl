<?php
    if ($modules) :
    global $config, $loader, $registry;

        $loader->model('custom/general');
        $model = $registry->get('model_custom_general');
        $layout_id = $model->getCurrentLayout();

if (isset($layout_id) && $layout_id != 1 && $layout_id != 2) {

    if ($layout_id == 7) {
        echo '<aside class="col-md-4 col-lg-4 shopping-cart-aside">';
    } else {
        echo '<aside class="col-sm-4 col-md-3 content-aside right_column">';
    }

}
		foreach ($modules as $module) :  echo $module;   endforeach;
        if (isset($layout_id) && $layout_id != 1 && $layout_id != 2) : echo '</aside>'; endif;
    endif;
?>
