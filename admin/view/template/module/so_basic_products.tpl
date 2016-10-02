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
					<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?> <b style="color:#f00">*</b></label>
						<div class="col-sm-10">
							<div class="col-sm-5">
								<input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
							</div>
							<?php if ($error_name) { ?>
								<div class="text-danger col-sm-12"><?php echo $error_name; ?></div>
							<?php }else{?>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_name_desc ?></i>
							<?php } ?>
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
						<a href="#virtuemart_module" data-toggle="tab">
							<?php echo $entry_module ?>
						</a>
					</li>
					<li>
						<a href="#virtuemart_source_option" data-toggle="tab">
							<?php echo $entry_source_option ?>
						</a>
					</li>
					<li>
						<a href="#virtuemart_product_option" data-toggle="tab">
							<?php echo $entry_product_option ?>
						</a>
					</li>
					<li>
						<a href="#virtuemart_image_option" data-toggle="tab">
							<?php echo $entry_image_option ?>
						</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane" id="virtuemart_module">
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
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_nb_column0_desc?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-column_992"><?php echo $entry_column ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="nb_column1" id="input-column_992" class="form-control">
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
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_nb_column1_desc?></i>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-column_768_992"><?php echo $entry_column ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="nb_column2" id="input-column_768_992" class="form-control">
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
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_nb_column2_desc?></i>
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
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_nb_column3_desc?></i>
							</div>
						</div>
					</div>
			<!-- ----------------------------------------------------------------------- -->
					<div class="tab-pane" id="virtuemart_source_option">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-category"><?php echo $entry_category; ?> <b style="color:#f00">*</b></label>
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
							<label class="col-sm-2 control-label" for="input-category_depth"><?php echo $entry_category_depth; ?> <b style="color:#f00">*</b></label>
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
							<label class="col-sm-2 control-label" for="input-limitation"><?php echo $entry_limitation; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="limitation" value="<?php echo $limitation; ?>" id="input-limitation" class="form-control" />
								</div>
								<?php if ($error_limitation) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_limitation; ?></div>
								<?php }else{ ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_limitation_desc ?></i>
								<?php } ?>
							</div>
						</div>
					</div>
			<!-- ----------------------------------------------------------------------- -->
					<div class="tab-pane" id="virtuemart_product_option">
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
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_title_maxlength_desc ?></i>
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
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_description_maxlength_desc ?></i>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-display_price"><?php echo $entry_display_price; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<label class="radio-inline">
										<?php if ($display_price) { ?>
										<input type="radio" name="display_price" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<?php } else { ?>
										<input type="radio" name="display_price" value="1" />
										<?php echo $text_yes; ?>
										<?php } ?>
									</label>
									<label class="radio-inline">
										<?php if (!$display_price) { ?>
										<input type="radio" name="display_price" value="0" checked="checked" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="display_price" value="0" />
										<?php echo $text_no; ?>
										<?php } ?>
									</label>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_display_price_desc ?></i>
							</div>
						</div>
						
					</div>
			<!-- ----------------------------------------------------------------------- -->
					<div class="tab-pane" id="virtuemart_image_option">
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
								<?php }else{?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_height_desc ?></i>
								<?php } ?>
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

$("input[name='child_category']").change(function(){
	val = $(this).val();
	if(val ==0)
	{
		$('#input-category_depth_form').hide();
	}else
	{
		$('#input-category_depth_form').show();
	}
});
//--></script>
</div>
<?php echo $footer; ?>