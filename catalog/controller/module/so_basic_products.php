<?php
class ControllerModuleSobasicproducts extends Controller {
	public function index($setting) {
		$this->load->language('module/so_basic_products');
		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('module/so_basic_products');
		$this->load->model('tool/image');
		if($setting['child_category'])
		{
			for($i=1; $i<=$setting['category_depth'];$i++)
			{
				foreach ($setting['category'] as $categorys)
				{
					$filter_data = array(
						'category_id'  => $categorys,
					);
					$categoryss = $this->model_module_so_basic_products->getcategories_son($filter_data);
					foreach ($categoryss as $category)
					{
						$setting['category'][]  = $category['category_id'];
					}
				}
				
			}
		}
		$setting['category'] = array_unique($setting['category']);
		$str_categorys = implode(",",$setting['category']);
		
		$filter_data = array(
			'filter_category_id'  => $str_categorys,
			'sort'         => $setting['product_sort'],
			'order'        => $setting['product_ordering'],
			'limit'        => $setting['limitation'] ,
			'start'        => '0' 
		);
		
		$products_arr = $this->model_module_so_basic_products->getProducts_basic_products($filter_data);
		if (!isset($setting['limit'])) {
			$setting['limit'] = 3;
		}
		if (!isset($setting['width'])) {
			$setting['width'] = 100;
		}
		if (!isset($setting['height'])) {
			$setting['height'] = 200;
		}
		
		foreach($products_arr as $product_info)
		{
			$product_image = $this->model_module_so_basic_products->getImageProduct_basic_products($product_info['product_id']);
			$product_image_first = array_shift($product_image);
			if ($product_info['image']) {
				$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
			}elseif($product_image_first['image']){
				$image = $this->model_tool_image->resize($product_image_first['image'], $setting['width'], $setting['height']);
			} else {
				$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
			}
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}
			$data['nb_column0'] = floor(12/$setting['nb_column0']);
			$data['nb_column1'] = floor(12/$setting['nb_column1']);
			$data['nb_column2'] = floor(12/$setting['nb_column2']);
			$data['nb_column3'] = floor(12/$setting['nb_column3']);
			$data['item_link_target'] = $setting['item_link_target'];
			$data['display_title'] = $setting['display_title'];
			$data['display_description'] = $setting['display_description'];
			$data['display_price'] = $setting['display_price'];
			$data['product_image'] = $setting['product_image'];
			$name = ((strlen($product_info['name']) > $setting['title_maxlength'] && $setting['title_maxlength'] !=0)  ? utf8_substr(strip_tags(html_entity_decode($product_info['name'], ENT_QUOTES, 'UTF-8')), 0, $setting['title_maxlength']) . '..' : $product_info['name']);
			$description = ((strlen($product_info['description']) > $setting['description_maxlength'] && $setting['description_maxlength'] != 0) ? utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $setting['description_maxlength']) . '..' : $product_info['description']);
			$data['products'][] = array(
					'product_id'  => $product_info['product_id'],
					'thumb'       => $image,
					'name'        => $name,
					'description' => $description,
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
				);
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/so_basic_products.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/so_basic_products.tpl', $data);
		} else {
			return $this->load->view('default/template/module/so_basic_products.tpl', $data);
		}
	
	}
}