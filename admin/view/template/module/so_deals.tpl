<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-featured" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
			</div>
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if ($error_warning) { ?>
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
    <div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
		</div>
		<div class="panel-body">
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-featured" class="form-horizontal">
				<div class="form-group">
					<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?> <b style="font-weight:bold; color:#f00">*</b></label>
					<div class="col-sm-10">
						<div class="col-sm-5">
							<input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
						</div>
						<?php if ($error_name) { ?>
							<div class="text-danger col-sm-12"><?php echo $error_name; ?></div>
						<?php }else { ?>
							<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_name_desc ?></i>
						<?php } ?>
					</div>
				</div>
				<div class="form-group">
					<input type="hidden" name="moduleid" value="<?php echo isset($_GET['module_id']) && !empty($_GET['module_id']) ? $_GET['module_id'] : $moduleid; ?>" />
					<label class="col-sm-2 control-label" for="input-head_name"><?php echo $entry_head_name; ?> <b style="color:#f00">*</b></label>
					<div class="col-sm-10">
						<div class="col-sm-5">
							<?php
								$i = 0;
								foreach ($languages as $language) { $i++; ?>
							<input type="text" name="module_description[<?php echo $language['language_id']; ?>][head_name]" placeholder="<?php echo $entry_head_name; ?>" id="input-head-name-<?php echo $language['language_id']; ?>" value="<?php echo isset($module_description[$language['language_id']]['head_name']) ? $module_description[$language['language_id']]['head_name'] : ''; ?>" class="form-control <?php echo ($i>1) ? ' hide ' : ' first-name'; ?>" />
							<?php
									 if($i == 1){ ?>
							<input type="hidden" class="form-control" id="input-head_name" placeholder="Module Head Name" value="<?php echo isset($module_description[$language['language_id']]['head_name']) ? $module_description[$language['language_id']]['head_name'] : ''; ?>" name="head_name">
							<?php }
									 ?>
							<?php } ?>
						</div>
						<div class="col-sm-2">
							<select  class="form-control" id="language">
								<?php foreach ($languages as $language) { ?>
								<option value="<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></option>
								<?php } ?>
							</select>
						</div>
						<?php if ($error_head_name) { ?>
						<div class="text-danger col-sm-12"><?php echo $error_head_name; ?></div>
						<?php }else { ?>
						<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_head_name_desc ?></i>
						<?php } ?>

					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="input-disp_title_module"><?php echo $entry_display_title_module; ?></label>
					<div class="col-sm-10">
						<div class="col-sm-5">
							<select name="disp_title_module" id="input-disp_title_module" class="form-control">
								<?php
								if ($disp_title_module) { ?>
								<option value="1" selected="selected"><?php echo $text_yes; ?></option>
								<option value="0"><?php echo $text_no; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_yes; ?></option>
								<option value="0" selected="selected"><?php echo $text_no; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
					<div class="col-sm-10">
						<div class="col-sm-5">
							<select name="status" id="input-status" class="form-control">
								<?php if ($status) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
				</div>
				
			<div class="tab-pane">
				<ul class="nav nav-tabs" id="virtuemart">
					<li>
						<a href="#module" data-toggle="tab">
							<?php echo $entry_module ?>
						</a>
					</li>
					<li>
						<a href="#source_option" data-toggle="tab">
							<?php echo $entry_source_option ?>
						</a>
					</li>
					<li>
						<a href="#items_option" data-toggle="tab">
							<?php echo $entry_items_option ?>
						</a>
					</li>
					<li>
						<a href="#image_option" data-toggle="tab">
							<?php echo $entry_image_option ?>
						</a>
					</li>
					<li>
						<a href="#effect_option" data-toggle="tab">
							<?php echo $entry_effect_option ?>
						</a>
					</li>
					<li>
						<a href="#advanced" data-toggle="tab">
							<?php echo $entry_advanced ?>
						</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane" id="module">
						<div class="form-group" id="input-category_depth_form">
							<label class="col-sm-2 control-label" for="input-class_suffix"><?php echo $entry_class_suffix; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="class_suffix" value="<?php echo $class_suffix; ?>" id="input-class_suffix" class="form-control" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-open_link"><?php echo $entry_open_link ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="item_link_target" id="input-open_link" class="form-control">
										<?php 
											foreach($item_link_targets as $option_id => $option_value)
											{
												$selected = ($option_id == $item_link_target) ? 'selected' :'';
										?>
												<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
										<?php
											}
										?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_open_link_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-column_1200"><?php echo $entry_column ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="nb_column0" id="input-column_1200" class="form-control">
										<?php 
										foreach($nb_columns as $option_id => $option_value)
										{
										$selected = ($option_id == $nb_column0) ? 'selected' :'';
										?>
										<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
										<?php
											}
										?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_nb_column0_desc ?></i>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-column_992_1199"><?php echo $entry_column ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="nb_column1" id="input-column_992_1199" class="form-control">
										<?php
										foreach($nb_columns as $option_id => $option_value)
										{
										$selected = ($option_id == $nb_column1) ? 'selected' :'';
										?>
										<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
										<?php
											}
										?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_nb_column1_desc ?></i>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-column_768_991"><?php echo $entry_column ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="nb_column2" id="input-column_768_991" class="form-control">
										<?php
										foreach($nb_columns as $option_id => $option_value)
										{
										$selected = ($option_id == $nb_column2) ? 'selected' :'';
										?>
										<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
										<?php
											}
										?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_nb_column2_desc ?></i>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-column_480_767"><?php echo $entry_column ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="nb_column3" id="input-column_480_767" class="form-control">
										<?php
										foreach($nb_columns as $option_id => $option_value)
										{
										$selected = ($option_id == $nb_column3) ? 'selected' :'';
										?>
										<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
										<?php
											}
										?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_nb_column3_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-column_0_479"><?php echo $entry_column ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="nb_column4" id="input-column_0_479" class="form-control">
										<?php
										foreach($nb_columns as $option_id => $option_value)
										{
										$selected = ($option_id == $nb_column4) ? 'selected' :'';
										?>
										<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
										<?php
											}
										?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_nb_column4_desc ?></i>
							</div>
						</div>
					</div>
			<!-- ----------------------------------------------------------------------- -->
					<div class="tab-pane" id="source_option">
						<label class="col-sm-12">For General</label>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-category"><?php echo $entry_category; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="category" value="" placeholder="<?php echo $entry_category; ?>" id="input-category" class="form-control" />
									<div id="featured-category" class="well well-sm" style="height: 150px; overflow: auto;">
									<?php foreach ($categorys as $category) { ?>
									<div id="featured-category<?php echo $category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $category['name']; ?>
											<input type="hidden" name="category[]" value="<?php echo $category['category_id']; ?>" />
											</div>
										<?php } ?>
									</div>
								</div>
								<?php if ($error_category) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_category; ?></div>
								<?php }else{ ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_category_desc?></i>
								<?php } ?>
								
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-child_category"><?php echo $entry_child_category; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<label class="radio-inline">
										<?php if ($child_category) { ?>
										<input type="radio" name="child_category" value="1" checked="checked" />
										<?php echo $entry_include; ?>
										<?php } else { ?>
										<input type="radio" name="child_category" value="1" />
										<?php echo $entry_include; ?>
										<?php } ?>
									</label>
									<label class="radio-inline">
										<?php if (!$child_category) { ?>
										<input type="radio" name="child_category" value="0" checked="checked" />
										<?php echo $entry_exclude; ?>
										<?php } else { ?>
										<input type="radio" name="child_category" value="0" />
										<?php echo $entry_exclude; ?>
										<?php } ?>
									</label>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_child_category_desc?></i>
							</div>
						</div>
						<div class="form-group" id="input-category_depth_form">
							<label class="col-sm-2 control-label" for="input-category_depth"><?php echo $entry_category_depth; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="category_depth" value="<?php echo $category_depth; ?>" id="input-category_depth" class="form-control" />
								</div>
								<?php if ($error_category_depth) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_category_depth; ?></div>
								<?php }else{ ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_category_depth_desc ?></i>
								<?php } ?>
								
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-product_order"><?php echo $entry_product_order; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="product_sort" id="input-product_order" class="form-control">
										<?php 
											foreach($product_sorts as $option_id => $option_value)
											{
												$selected = ($option_id == $product_sort) ? 'selected' :'';
										?>
												<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
										<?php
											}
										?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_product_order_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-ordering"><?php echo $entry_ordering; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="product_ordering" id="input-ordering" class="form-control">
										<?php 
											foreach($product_orderings as $option_id => $option_value)
											{
												$selected = ($option_id == $product_ordering) ? 'selected' :'';
										?>
												<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
										<?php
											}
										?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_ordering_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-source_limit"><?php echo $entry_source_limit; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="source_limit" value="<?php echo $source_limit; ?>" id="input-source_limit" class="form-control" />
								</div>
								<?php if ($error_source_limit) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_source_limit; ?></div>
								<?php }else{ ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_source_limit_desc?></i>
								<?php } ?>
								
							</div>
						</div>
					</div>
			<!-- ----------------------------------------------------------------------- -->
					<div class="tab-pane" id="items_option">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-display_title"><?php echo $entry_display_title; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<label class="radio-inline">
										<?php if ($display_title) { ?>
										<input type="radio" name="display_title" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<?php } else { ?>
										<input type="radio" name="display_title" value="1" />
										<?php echo $text_yes; ?>
										<?php } ?>
									</label>
									<label class="radio-inline">
										<?php if (!$display_title) { ?>
										<input type="radio" name="display_title" value="0" checked="checked" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="display_title" value="0" />
										<?php echo $text_no; ?>
										<?php } ?>
									</label>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_display_title_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-title_maxlength"><?php echo $entry_title_maxlength; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="title_maxlength" value="<?php echo $title_maxlength; ?>" id="input-title_maxlength" class="form-control" />
								</div>
								<?php if ($error_title_maxlength) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_title_maxlength; ?></div>
								<?php }else{ ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_title_maxlength_desc?></i>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-display_description"><?php echo $entry_display_description; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<label class="radio-inline">
										<?php if ($display_description) { ?>
										<input type="radio" name="display_description" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<?php } else { ?>
										<input type="radio" name="display_description" value="1" />
										<?php echo $text_yes; ?>
										<?php } ?>
									</label>
									<label class="radio-inline">
										<?php if (!$display_description) { ?>
										<input type="radio" name="display_description" value="0" checked="checked" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="display_description" value="0" />
										<?php echo $text_no; ?>
										<?php } ?>
									</label>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_display_description_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-description_maxlength"><?php echo $entry_description_maxlength; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="description_maxlength" value="<?php echo $description_maxlength; ?>" id="input-description_maxlength" class="form-control" />
								</div>
								<?php if ($error_description_maxlength) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_description_maxlength; ?></div>
								<?php }else{ ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_description_maxlength_desc?></i>
								<?php } ?>
							</div>
						</div>
						
					</div>
			<!-- ----------------------------------------------------------------------- -->
					<div class="tab-pane" id="image_option">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-product_image"><?php echo $entry_product_image; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<label class="radio-inline">
										<?php if ($product_image) { ?>
										<input type="radio" name="product_image" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<?php } else { ?>
										<input type="radio" name="product_image" value="1" />
										<?php echo $text_yes; ?>
										<?php } ?>
									</label>
									<label class="radio-inline">
										<?php if (!$product_image) { ?>
										<input type="radio" name="product_image" value="0" checked="checked" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="product_image" value="0" />
										<?php echo $text_no; ?>
										<?php } ?>
									</label>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_product_image_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="width" value="<?php echo $width; ?>" id="input-width" class="form-control" />
								</div>
								<?php if ($error_width) { ?>
								<div class="text-danger col-sm-12"><?php echo $error_width; ?></div>
								<?php }else { ?>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_width_desc ?></i>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="height" value="<?php echo $height; ?>" id="input-height" class="form-control" />
								</div>
								<?php if ($error_height) { ?>
								<div class="text-danger col-sm-12"><?php echo $error_height; ?></div>
								<?php }else{ ?>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_height_desc ?></i>
								<?php } ?>
							</div>
						</div>
					</div>
					<!-- ----------------------------------------------------------------------- -->
					<div class="tab-pane" id="effect_option">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-margin"><?php echo $entry_margin; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="margin" value="<?php echo $margin; ?>" id="input-margin" class="form-control" />
								</div>
								<?php if ($error_margin) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_margin; ?></div>
								<?php }else{ ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_margin_desc?></i>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-slideBy"><?php echo $entry_slideBy; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="slideBy" value="<?php echo $slideBy; ?>" id="input-slideBy" class="form-control" />
								</div>
								<?php if ($error_slideBy) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_slideBy; ?></div>
								<?php }else{ ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_slideBy_desc?></i>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-autoplay"><?php echo $entry_autoplay; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<label class="radio-inline">
										<?php if ($autoplay) { ?>
										<input type="radio" name="autoplay" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<?php } else { ?>
										<input type="radio" name="autoplay" value="1" />
										<?php echo $text_yes; ?>
										<?php } ?>
									</label>
									<label class="radio-inline">
										<?php if (!$autoplay) { ?>
										<input type="radio" name="autoplay" value="0" checked="checked" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="autoplay" value="0" />
										<?php echo $text_no; ?>
										<?php } ?>
									</label>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_autoplay_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-autoplayTimeout"><?php echo $entry_autoplayTimeout; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="autoplayTimeout" value="<?php echo $autoplayTimeout; ?>" id="input-autoplayTimeout" class="form-control" />
								</div>
								<?php if ($error_autoplayTimeout) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_autoplayTimeout; ?></div>
								<?php }else{ ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_autoplayTimeout_desc?></i>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-autoplayHoverPause"><?php echo $entry_autoplayHoverPause; ?></label>
							<div class="col-sm-10">	
								<div class="col-sm-5">
									<label class="radio-inline">
										<?php if ($autoplayHoverPause) { ?>
										<input type="radio" name="autoplayHoverPause" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<?php } else { ?>
										<input type="radio" name="autoplayHoverPause" value="1" />
										<?php echo $text_yes; ?>
										<?php } ?>
									</label>
									<label class="radio-inline">
										<?php if (!$autoplayHoverPause) { ?>
										<input type="radio" name="autoplayHoverPause" value="0" checked="checked" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="autoplayHoverPause" value="0" />
										<?php echo $text_no; ?>
										<?php } ?>
									</label>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_autoplayHoverPause_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-autoplaySpeed"><?php echo $entry_autoplaySpeed; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="autoplaySpeed" value="<?php echo $autoplaySpeed; ?>" id="input-autoplaySpeed" class="form-control" />
								</div>
								<?php if ($error_autoplaySpeed) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_autoplaySpeed; ?></div>
								<?php }else{ ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_autoplaySpeed_desc?></i>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-smartSpeed"><?php echo $entry_smartSpeed; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="smartSpeed" value="<?php echo $smartSpeed; ?>" id="input-smartSpeed" class="form-control" />
								</div>
								<?php if ($error_smartSpeed) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_smartSpeed; ?></div>
								<?php }else{ ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_smartSpeed_desc?></i>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-startPosition"><?php echo $entry_startPosition; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="startPosition" value="<?php echo $startPosition; ?>" id="input-startPosition" class="form-control" />
								</div>
								<?php if ($error_startPosition) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_startPosition; ?></div>
								<?php }else{ ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_startPosition_desc?></i>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-mouseDrag"><?php echo $entry_mouseDrag; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<label class="radio-inline">
										<?php if ($mouseDrag) { ?>
										<input type="radio" name="mouseDrag" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<?php } else { ?>
										<input type="radio" name="mouseDrag" value="1" />
										<?php echo $text_yes; ?>
										<?php } ?>
									</label>
									<label class="radio-inline">
										<?php if (!$mouseDrag) { ?>
										<input type="radio" name="mouseDrag" value="0" checked="checked" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="mouseDrag" value="0" />
										<?php echo $text_no; ?>
										<?php } ?>
									</label>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_mouseDrag_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-touchDrag"><?php echo $entry_touchDrag; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<label class="radio-inline">
										<?php if ($touchDrag) { ?>
										<input type="radio" name="touchDrag" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<?php } else { ?>
										<input type="radio" name="touchDrag" value="1" />
										<?php echo $text_yes; ?>
										<?php } ?>
									</label>
									<label class="radio-inline">
										<?php if (!$touchDrag) { ?>
										<input type="radio" name="touchDrag" value="0" checked="checked" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="touchDrag" value="0" />
										<?php echo $text_no; ?>
										<?php } ?>
									</label>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_touchDrag_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-pullDrag"><?php echo $entry_pullDrag; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<label class="radio-inline">
										<?php if ($pullDrag) { ?>
										<input type="radio" name="pullDrag" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<?php } else { ?>
										<input type="radio" name="pullDrag" value="1" />
										<?php echo $text_yes; ?>
										<?php } ?>
									</label>
									<label class="radio-inline">
										<?php if (!$pullDrag) { ?>
										<input type="radio" name="pullDrag" value="0" checked="checked" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="pullDrag" value="0" />
										<?php echo $text_no; ?>
										<?php } ?>
									</label>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_pullDrag_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-button_page"><?php echo $entry_button_page; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="button_page" id="input-button_page" class="form-control">
										<?php 
										foreach($button_pages as $option_id => $option_value)
											{
												$selected = ($option_id == $button_page) ? 'selected' :'';
										?>
												<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
										<?php
											}
										?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_button_page_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-dots"><?php echo $entry_dots; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<label class="radio-inline">
										<?php if ($dots) { ?>
										<input type="radio" name="dots" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<?php } else { ?>
										<input type="radio" name="dots" value="1" />
										<?php echo $text_yes; ?>
										<?php } ?>
									</label>
									<label class="radio-inline">
										<?php if (!$dots) { ?>
										<input type="radio" name="dots" value="0" checked="checked" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="dots" value="0" />
										<?php echo $text_no; ?>
										<?php } ?>
									</label>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_dots_desc ?></i>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-dotsSpeed"><?php echo $entry_dotsSpeed; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="dotsSpeed" value="<?php echo $dotsSpeed; ?>" id="input-dotsSpeed" class="form-control" />
								</div>
								<?php if ($error_dotsSpeed) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_dotsSpeed; ?></div>
								<?php }else{ ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_dotsSpeed_desc?></i>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-navs"><?php echo $entry_navs; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<label class="radio-inline">
										<?php if ($navs) { ?>
										<input type="radio" name="navs" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<?php } else { ?>
										<input type="radio" name="navs" value="1" />
										<?php echo $text_yes; ?>
										<?php } ?>
									</label>
									<label class="radio-inline">
										<?php if (!$navs) { ?>
										<input type="radio" name="navs" value="0" checked="checked" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="navs" value="0" />
										<?php echo $text_no; ?>
										<?php } ?>
									</label>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_navs_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-navSpeed"><?php echo $entry_navspeed; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="navSpeed" value="<?php echo $navSpeed; ?>" id="input-navSpeed" class="form-control" />
								</div>
								<?php if ($error_navSpeed) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_navSpeed; ?></div>
								<?php }else{ ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_navspeed_desc?></i>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-effect"><?php echo $entry_effect; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="effect" id="input-effect" class="form-control">
										<?php 
										foreach($effects as $option_id => $option_value)
											{
												$selected = ($option_id == $effect) ? 'selected' :'';
										?>
												<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
										<?php
											}
										?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_effect_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-duration"><?php echo $entry_duration; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="duration" value="<?php echo $duration; ?>" id="input-duration" class="form-control" />
								</div>
								<?php if ($error_duration) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_duration; ?></div>
								<?php }else{ ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_duration_desc?></i>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-delay"><?php echo $entry_delay; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="delay" value="<?php echo $delay; ?>" id="input-delay" class="form-control" />
								</div>
								<?php if ($error_delay) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_delay; ?></div>
								<?php }else{ ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_delay_desc?></i>
								<?php } ?>
							</div>
						</div>
					</div>
			<!-- ----------------------------------------------------------------------- -->
					<div class="tab-pane" id="advanced">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-pretext"><?php echo $entry_pretext; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<textarea name="pretext" rows="5" class="form-control" id="input-pretext"><?php echo $pretext?></textarea>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_pretext_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-posttext"><?php echo $entry_posttext; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<textarea name="posttext" rows="5" class="form-control" id="input-posttext"><?php echo $posttext?></textarea>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_posttext_desc ?></i>
							</div>
						</div>
					</div>
			<!-- ----------------------------------------------------------------------- -->
				</div>
			</div>
        </form>
      </div>
    </div>	
  </div>
  <script type="text/javascript"><!--
$('input[name=\'category\']').autocomplete({
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['category_id']
					}
				}));
			}
		});
	},
	select: function(item) {
		$('input[name=\'category\']').val('');
		
		$('#featured-category' + item['value']).remove();
		
		$('#featured-category').append('<div id="featured-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="category[]" value="' + item['value'] + '" /></div>');	
	}
});
	
$('#featured-category').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

//--></script>
<script type="text/javascript"><!--
$('#virtuemart a:first').tab('show');
if($("input[name='child_category']:radio:checked").val() == '0')
{
	$('#input-category_depth_form').hide();
}else
{
	$('#input-category_depth_form').show();
}

$("input[name='child_category']:radio").change(function(){
	if($(this).val() == '0')
	{
		$('#input-category_depth_form').hide();
	}else
	{
		$('#input-category_depth_form').show();
	}
});
	$('#language').change(function(){
		var that = $(this), opt_select = $('option:selected', that).val() , _input = $('#input-head-name-'+opt_select);
		$('[id^="input-head-name-"]').addClass('hide');
		_input.removeClass('hide');
	});

	$('.first-name').change(function(){
		$('input[name="name"]').val($(this).val());
	});
//--></script>
</div>
<?php echo $footer; ?>