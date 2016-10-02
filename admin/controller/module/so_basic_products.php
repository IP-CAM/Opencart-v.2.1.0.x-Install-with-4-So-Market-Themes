<?php
class ControllerModuleSobasicproducts extends Controller {
	private $error = array();
	public function index() {
		$this->load->language('module/so_basic_products');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate() && $this->validate_category()) {
			if (!isset($this->request->get['module_id'])) {
				
				$this->model_extension_module->addModule('so_basic_products', $this->request->post);
				
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] 		= $this->language->get('heading_title');

		$data['text_edit'] 			= $this->language->get('text_edit');
		$data['text_enabled'] 		= $this->language->get('text_enabled');
		$data['text_disabled'] 		= $this->language->get('text_disabled');

		$data['entry_name'] 					= $this->language->get('entry_name');
		$data['entry_name_desc'] 				= $this->language->get('entry_name_desc');
		$data['entry_module'] 					= $this->language->get('entry_module');
		$data['entry_source_option'] 			= $this->language->get('entry_source_option');
		$data['entry_open_link'] 				= $this->language->get('entry_open_link');
		$data['entry_open_link_desc'] 			= $this->language->get('entry_open_link_desc');
		$data['entry_column'] 					= $this->language->get('entry_column');
		$data['entry_nb_column0_desc'] 			= $this->language->get('entry_nb_column0_desc');
		$data['entry_nb_column1_desc'] 			= $this->language->get('entry_nb_column1_desc');
		$data['entry_nb_column2_desc'] 			= $this->language->get('entry_nb_column2_desc');
		$data['entry_nb_column3_desc'] 			= $this->language->get('entry_nb_column3_desc');
		
		
		$data['entry_category'] 				= $this->language->get('entry_category');
		$data['entry_category_desc'] 			= $this->language->get('entry_category_desc');
		$data['entry_child_category'] 			= $this->language->get('entry_child_category');
		$data['entry_child_category_desc'] 		= $this->language->get('entry_child_category_desc');
		$data['entry_status'] 					= $this->language->get('entry_status');
		$data['entry_include'] 					= $this->language->get('entry_include');
		$data['entry_exclude'] 					= $this->language->get('entry_exclude');
		$data['entry_category_depth'] 			= $this->language->get('entry_category_depth');
		$data['entry_category_depth_desc'] 		= $this->language->get('entry_category_depth_desc');
		$data['entry_product_order'] 			= $this->language->get('entry_product_order');
		$data['entry_product_order_desc'] 		= $this->language->get('entry_product_order_desc');
		$data['entry_ordering'] 				= $this->language->get('entry_ordering');
		$data['entry_ordering_desc'] 			= $this->language->get('entry_ordering_desc');
		$data['entry_limitation'] 				= $this->language->get('entry_limitation');
		$data['entry_limitation_desc'] 			= $this->language->get('entry_limitation_desc');
		
		
		$data['entry_product_option'] 			= $this->language->get('entry_product_option');
		$data['entry_display_title'] 			= $this->language->get('entry_display_title');
		$data['entry_display_title_desc'] 		= $this->language->get('entry_display_title_desc');
		$data['entry_title_maxlength'] 			= $this->language->get('entry_title_maxlength');
		$data['entry_title_maxlength_desc'] 	= $this->language->get('entry_title_maxlength_desc');
		$data['entry_display_description'] 		= $this->language->get('entry_display_description');
		$data['entry_display_description_desc'] = $this->language->get('entry_display_description_desc');
		$data['entry_description_maxlength'] 	= $this->language->get('entry_description_maxlength');
		$data['entry_description_maxlength_desc']= $this->language->get('entry_description_maxlength_desc');
		$data['entry_display_price'] 			= $this->language->get('entry_display_price');
		$data['entry_display_price_desc'] 		= $this->language->get('entry_display_price_desc');
		$data['entry_display_readmore_link'] 	= $this->language->get('entry_display_readmore_link');
		$data['entry_display_add_to_cart'] 		= $this->language->get('entry_display_add_to_cart');
		$data['entry_readmore_text'] 			= $this->language->get('entry_readmore_text');
		$data['entry_image_option'] 			= $this->language->get('entry_image_option');
		$data['entry_product_image'] 			= $this->language->get('entry_product_image');
		$data['entry_product_image_desc'] 		= $this->language->get('entry_product_image_desc');
		$data['entry_description'] 				= $this->language->get('entry_description');
		$data['entry_extend_folder'] 			= $this->language->get('entry_extend_folder');
		$data['entry_extend_folder_text'] 		= $this->language->get('entry_extend_folder_text');
		$data['entry_order_to_get'] 			= $this->language->get('entry_order_to_get');
		$data['entry_resize_mode'] 				= $this->language->get('entry_resize_mode');
		$data['entry_width'] 					= $this->language->get('entry_width');
		$data['entry_width_desc'] 				= $this->language->get('entry_width_desc');
		$data['entry_height'] 					= $this->language->get('entry_height');
		$data['entry_height_desc'] 				= $this->language->get('entry_height_desc');
		
		$data['help_product'] 					= $this->language->get('help_product');
		
		$data['text_yes'] 						= $this->language->get('text_yes');
		$data['text_no'] 						= $this->language->get('text_no');
		$data['entry_status'] 					= $this->language->get('entry_status');
		$data['button_save'] 					= $this->language->get('button_save');
		$data['button_cancel'] 					= $this->language->get('button_cancel');
		
		// Validation -----------------------------------------
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['category'])) {
			$data['error_category'] = $this->error['category'];
		} else {
			$data['error_category'] = '';
		}
		
		if (isset($this->error['category_depth'])) {
			$data['error_category_depth'] = $this->error['category_depth'];
		} else {
			$data['error_category_depth'] = '';
		}
		
		if (isset($this->error['limitation'])) {
			$data['error_limitation'] = $this->error['limitation'];
		} else {
			$data['error_limitation'] = '';
		}
		
		if (isset($this->error['title_maxlength'])) {
			$data['error_title_maxlength'] = $this->error['title_maxlength'];
		} else {
			$data['error_title_maxlength'] = '';
		}
		
		if (isset($this->error['description_maxlength'])) {
			$data['error_description_maxlength'] = $this->error['description_maxlength'];
		} else {
			$data['error_description_maxlength'] = '';
		}
		
		if (isset($this->error['width'])) {
			$data['error_width'] = $this->error['width'];
		} else {
			$data['error_width'] = '';
		}
		
		if (isset($this->error['height'])) {
			$data['error_height'] = $this->error['height'];
		} else {
			$data['error_height'] = '';
		}
		//---------------------------------------------------------------------------------
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/so_basic_products', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/so_basic_products', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/so_basic_products', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/so_basic_products', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
		
		if (isset($this->request->post['item_link_target'])) {
			$data['item_link_target'] = $this->request->post['item_link_target'];
		} elseif (!empty($module_info)) {
			$data['item_link_target'] = $module_info['item_link_target'];
		} else {
			$data['item_link_target'] = '';
		}
		$data['item_link_targets'] = array(
					'_blank' => 'New Window',
					'_self'  => 'Same Window',
				);
		
		$data['nb_columns'] = array(
			'1'   => '1',
			'2'   => '2',
			'3'   => '3',
			'4'   => '4',
			'6'   => '6',
		);
		
		if (isset($this->request->post['nb_column0'])) {
			$data['nb_column0'] = $this->request->post['nb_column0'];
		} elseif (!empty($module_info)) {
			$data['nb_column0'] = $module_info['nb_column0'];
		} else {
			$data['nb_column0'] = '';
		}
		
		if (isset($this->request->post['nb_column1'])) {
			$data['nb_column1'] = $this->request->post['nb_column1'];
		} elseif (!empty($module_info)) {
			$data['nb_column1'] = $module_info['nb_column1'];
		} else {
			$data['nb_column1'] = '';
		}
		
		if (isset($this->request->post['nb_column2'])) {
			$data['nb_column2'] = $this->request->post['nb_column2'];
		} elseif (!empty($module_info)) {
			$data['nb_column2'] = $module_info['nb_column2'];
		} else {
			$data['nb_column2'] = '';
		}
		
		if (isset($this->request->post['nb_column3'])) {
			$data['nb_column3'] = $this->request->post['nb_column3'];
		} elseif (!empty($module_info)) {
			$data['nb_column3'] = $module_info['nb_column3'];
		} else {
			$data['nb_column3'] = '';
		}
		
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '1';
		}

		$this->load->model('catalog/category');

		$data['categorys'] = array();

		if (isset($this->request->post['category'])) {
			$categorys = $this->request->post['category'];
		} elseif (!empty($module_info)) {
			$categorys = $module_info['category'];
		} else {
			$categorys = array();
		}
		
		
		if($categorys != null)
		{
			foreach ($categorys as $category_id) {
				$category_info = $this->model_catalog_category->getCategory($category_id);

				if ($category_info) {
					$data['categorys'][] = array(
						'category_id' => $category_info['category_id'],
						'name'       => $category_info['name']
					);
				}
			}
		}
		
		
		if (isset($this->request->post['child_category'])) {
			$data['child_category'] = $this->request->post['child_category'];
		} elseif (!empty($module_info)) {
			$data['child_category'] = $module_info['child_category'];
		} else {
			$data['child_category'] = '1';
		}
		
		if (isset($this->request->post['category_depth'])) {
			$data['category_depth'] = $this->request->post['category_depth'];
		} elseif (!empty($module_info)) {
			$data['category_depth'] = $module_info['category_depth'];
		} else {
			$data['category_depth'] = '1';
		}
		
		$data['product_sorts'] = array(
			'pb.name' => 'Product Name',
			'p.model'  => 'Model',
			'p.price' => 'Price',
			'p.quantity' => 'Quantity',
		);
		if (isset($this->request->post['product_sort'])) {
			$data['product_sort'] = $this->request->post['product_sort'];
		} elseif (!empty($module_info)) {
			$data['product_sort'] = $module_info['product_sort'];
		} else {
			$data['product_sort'] = 'pb.name';
		}
		
		$data['product_orderings'] = array(
			'ASC'   => 'Ascending',
			'DESC'  => 'Descending',
		);
		
		if (isset($this->request->post['product_ordering'])) {
			$data['product_ordering'] = $this->request->post['product_ordering'];
		} elseif (!empty($module_info)) {
			$data['product_ordering'] = $module_info['product_ordering'];
		} else {
			$data['product_ordering'] = 'ASC';
		}
		
		if (isset($this->request->post['limitation'])) {
			$data['limitation'] = $this->request->post['limitation'];
		} elseif (!empty($module_info)) {
			$data['limitation'] = $module_info['limitation'];
		} else {
			$data['limitation'] = '4';
		}
		
		if (isset($this->request->post['display_title'])) {
			$data['display_title'] = $this->request->post['display_title'];
		} elseif (!empty($module_info)) {
			$data['display_title'] = $module_info['display_title'];
		} else {
			$data['display_title'] = '1';
		}
		
		if (isset($this->request->post['title_maxlength'])) {
			$data['title_maxlength'] = $this->request->post['title_maxlength'];
		} elseif (!empty($module_info)) {
			$data['title_maxlength'] = $module_info['title_maxlength'];
		} else {
			$data['title_maxlength'] = '50';
		}
		
		if (isset($this->request->post['display_description'])) {
			$data['display_description'] = $this->request->post['display_description'];
		} elseif (!empty($module_info)) {
			$data['display_description'] = $module_info['display_description'];
		} else {
			$data['display_description'] = '1';
		}
		
		if (isset($this->request->post['description_maxlength'])) {
			$data['description_maxlength'] = $this->request->post['description_maxlength'];
		} elseif (!empty($module_info)) {
			$data['description_maxlength'] = $module_info['description_maxlength'];
		} else {
			$data['description_maxlength'] = '100';
		}
		
		if (isset($this->request->post['display_price'])) {
			$data['display_price'] = $this->request->post['display_price'];
		} elseif (!empty($module_info)) {
			$data['display_price'] = $module_info['display_price'];
		} else {
			$data['display_price'] = '1';
		}
		
		if (isset($this->request->post['product_image'])) {
			$data['product_image'] = $this->request->post['product_image'];
		} elseif (!empty($module_info)) {
			$data['product_image'] = $module_info['product_image'];
		} else {
			$data['product_image'] = '1';
		}
		
		if (isset($this->request->post['width'])) {
			$data['width'] = $this->request->post['width'];
		} elseif (!empty($module_info)) {
			$data['width'] = $module_info['width'];
		} else {
			$data['width'] = '200';
		}
		
		if (isset($this->request->post['height'])) {
			$data['height'] = $this->request->post['height'];
		} elseif (!empty($module_info)) {
			$data['height'] = $module_info['height'];
		} else {
			$data['height'] = '200';
		}
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/so_basic_products.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/so_basic_products')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		if (!filter_var($this->request->post['category_depth'],FILTER_VALIDATE_FLOAT) || $this->request->post['category_depth'] < 0) {
			$this->error['category_depth'] = $this->language->get('error_category_depth');
		}
		if ($this->request->post['limitation'] != '0' && !filter_var($this->request->post['limitation'],FILTER_VALIDATE_FLOAT) || $this->request->post['limitation'] < 0) {
			$this->error['limitation'] = $this->language->get('error_limitation');
		}
		
		if ($this->request->post['title_maxlength'] != '0' && !filter_var($this->request->post['title_maxlength'],FILTER_VALIDATE_FLOAT) || $this->request->post['title_maxlength'] < 0) {
			
			$this->error['title_maxlength'] = $this->language->get('error_title_maxlength');
		}
		
		if ($this->request->post['description_maxlength'] != '0' && !filter_var($this->request->post['description_maxlength'],FILTER_VALIDATE_FLOAT) || $this->request->post['description_maxlength'] < 0) {
			$this->error['description_maxlength'] = $this->language->get('error_description_maxlength');
		}
		if (!filter_var($this->request->post['width'],FILTER_VALIDATE_FLOAT) || $this->request->post['width'] < 0) {
			$this->error['width'] = $this->language->get('error_width');
		}
		if (!filter_var($this->request->post['height'],FILTER_VALIDATE_FLOAT) || $this->request->post['height'] < 0) {
			$this->error['height'] = $this->language->get('error_height');
		}
		return !$this->error;
	}
	protected function validate_category() {
		
		if ($this->request->post['category'] == null) {
			$this->error['category'] = $this->language->get('error_category');
		}

		return !$this->error;
	}
}