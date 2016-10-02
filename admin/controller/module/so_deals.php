<?php
class ControllerModuleSodeals extends Controller {
	private $error = array();
	public function index() {
		$this->load->language('module/so_deals');
		$this->load->model('catalog/category');
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				
				$this->model_extension_module->addModule('so_deals', $this->request->post);
				
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
		//Default
		$data['heading_title']  = $this->language->get('heading_title');

		$data['text_edit']      = $this->language->get('text_edit');
		$data['text_enabled'] 	= $this->language->get('text_enabled');
		$data['text_disabled'] 	= $this->language->get('text_disabled');

		$data['entry_head_name'] 				= $this->language->get('entry_head_name');
		$data['entry_head_name_desc'] 			= $this->language->get('entry_head_name_desc');
		$data['entry_name'] 	= $this->language->get('entry_name');
		$data['entry_name_desc'] 	= $this->language->get('entry_name_desc');
		$data['entry_display_title_module']     = $this->language->get('entry_display_title_module');
		
		$data['help_product'] 	= $this->language->get('help_product');
		
		$data['text_yes'] 		= $this->language->get('text_yes');
		$data['text_no'] 		= $this->language->get('text_no');
		$data['text_show'] 		= $this->language->get('text_show');
		$data['text_hide'] 		= $this->language->get('text_hide');
		$data['entry_status'] 	= $this->language->get('entry_status');
		$data['button_save'] 	= $this->language->get('button_save');
		$data['button_cancel'] 	= $this->language->get('button_cancel');
		$data['entry_status'] 	= $this->language->get('entry_status');
		$data['entry_include'] 	= $this->language->get('entry_include');
		$data['entry_exclude'] 	= $this->language->get('entry_exclude');
		
		//Title tabs
		$data['entry_module'] 			= $this->language->get('entry_module');
		$data['entry_source_option'] 	= $this->language->get('entry_source_option');
		$data['entry_tabs_option'] 		= $this->language->get('entry_tabs_option');
		$data['entry_items_option'] 	= $this->language->get('entry_items_option');
		$data['entry_image_option'] 	= $this->language->get('entry_image_option');
		$data['entry_effect_option'] 	= $this->language->get('entry_effect_option');
		$data['entry_advanced'] 	    = $this->language->get('entry_advanced');
		
		//Tabs General
		$data['entry_class_suffix']				= $this->language->get('entry_class_suffix');
		$data['entry_open_link'] 		= $this->language->get('entry_open_link');
		$data['entry_open_link_desc'] 	= $this->language->get('entry_open_link_desc');
		$data['entry_column'] 			= $this->language->get('entry_column');
		$data['entry_nb_column0_desc'] 		= $this->language->get('entry_nb_column0_desc');
		$data['entry_nb_column1_desc'] 		= $this->language->get('entry_nb_column1_desc');
		$data['entry_nb_column2_desc'] 		= $this->language->get('entry_nb_column2_desc');
		$data['entry_nb_column3_desc'] 		= $this->language->get('entry_nb_column3_desc');
		$data['entry_nb_column4_desc'] 		= $this->language->get('entry_nb_column4_desc');


		//Tabs Source options
		$data['entry_category'] 				= $this->language->get('entry_category');
		$data['entry_category_desc'] 			= $this->language->get('entry_category_desc');
		$data['entry_child_category'] 			= $this->language->get('entry_child_category');
		$data['entry_child_category_desc'] 		= $this->language->get('entry_child_category_desc');
		$data['entry_category_depth'] 			= $this->language->get('entry_category_depth');
		$data['entry_category_depth_desc'] 		= $this->language->get('entry_category_depth_desc');
		$data['entry_product_order'] 			= $this->language->get('entry_product_order');
		$data['entry_product_order_desc'] 		= $this->language->get('entry_product_order_desc');
		$data['entry_ordering']					= $this->language->get('entry_ordering');
		$data['entry_ordering_desc']			= $this->language->get('entry_ordering_desc');
		$data['entry_source_limit'] 			= $this->language->get('entry_source_limit');
		$data['entry_source_limit_desc'] 		= $this->language->get('entry_source_limit_desc');
		
		//Tabs Items options
		$data['entry_display_title'] 			= $this->language->get('entry_display_title');
		$data['entry_display_title_desc'] 		= $this->language->get('entry_display_title_desc');
		$data['entry_title_maxlength'] 			= $this->language->get('entry_title_maxlength');
		$data['entry_title_maxlength_desc'] 	= $this->language->get('entry_title_maxlength_desc');
		$data['entry_display_description'] 		= $this->language->get('entry_display_description');
		$data['entry_display_description_desc'] = $this->language->get('entry_display_description_desc');
		$data['entry_description_maxlength']	= $this->language->get('entry_description_maxlength');
		$data['entry_description_maxlength_desc']= $this->language->get('entry_description_maxlength_desc');
		
		
		//Tabs Image options
		$data['entry_product_image']		= $this->language->get('entry_product_image');
		$data['entry_product_image_desc'] 	= $this->language->get('entry_product_image_desc');
		$data['entry_width'] 				= $this->language->get('entry_width');
		$data['entry_width_desc'] 			= $this->language->get('entry_width_desc');
		$data['entry_height'] 				= $this->language->get('entry_height');
		$data['entry_height_desc'] 			= $this->language->get('entry_height_desc');
		
		//Tabs Effect options
		$data['entry_margin'] 				= $this->language->get('entry_margin');
		$data['entry_margin_desc'] 			= $this->language->get('entry_margin_desc');
		$data['entry_slideBy'] 				= $this->language->get('entry_slideBy');
		$data['entry_slideBy_desc'] 		= $this->language->get('entry_slideBy_desc');
		$data['entry_autoplay'] 			= $this->language->get('entry_autoplay');
		$data['entry_autoplay_desc'] 		= $this->language->get('entry_autoplay_desc');
		$data['entry_autoplayTimeout'] 		= $this->language->get('entry_autoplayTimeout');
		$data['entry_autoplayTimeout_desc'] = $this->language->get('entry_autoplayTimeout_desc');
		$data['entry_autoplayHoverPause'] 	= $this->language->get('entry_autoplayHoverPause');
		$data['entry_autoplayHoverPause_desc'] 	= $this->language->get('entry_autoplayHoverPause_desc');
		$data['entry_autoplaySpeed'] 		= $this->language->get('entry_autoplaySpeed');
		$data['entry_autoplaySpeed_desc'] 	= $this->language->get('entry_autoplaySpeed_desc');
		$data['entry_smartSpeed'] 			= $this->language->get('entry_smartSpeed');
		$data['entry_smartSpeed_desc'] 		= $this->language->get('entry_smartSpeed_desc');
		$data['entry_startPosition'] 		= $this->language->get('entry_startPosition');
		$data['entry_startPosition_desc'] 	= $this->language->get('entry_startPosition_desc');
		$data['entry_mouseDrag'] 			= $this->language->get('entry_mouseDrag');
		$data['entry_mouseDrag_desc'] 		= $this->language->get('entry_mouseDrag_desc');
		$data['entry_touchDrag'] 			= $this->language->get('entry_touchDrag');
		$data['entry_touchDrag_desc'] 		= $this->language->get('entry_touchDrag_desc');
		$data['entry_pullDrag'] 			= $this->language->get('entry_pullDrag');
		$data['entry_pullDrag_desc'] 		= $this->language->get('entry_pullDrag_desc');
		$data['entry_dots'] 				= $this->language->get('entry_dots');
		$data['entry_dots_desc'] 			= $this->language->get('entry_dots_desc');
		$data['entry_navs'] 				= $this->language->get('entry_navs');
		$data['entry_navs_desc'] 			= $this->language->get('entry_navs_desc');
		$data['entry_button_page'] 			= $this->language->get('entry_button_page');
		$data['entry_button_page_desc'] 	= $this->language->get('entry_button_page_desc');
		$data['entry_dotsSpeed'] 			= $this->language->get('entry_dotsSpeed');
		$data['entry_dotsSpeed_desc'] 		= $this->language->get('entry_dotsSpeed_desc');
		$data['entry_navspeed'] 			= $this->language->get('entry_navspeed');
		$data['entry_navspeed_desc'] 		= $this->language->get('entry_navspeed_desc');
		$data['entry_effect'] 				= $this->language->get('entry_effect');
		$data['entry_effect_desc'] 			= $this->language->get('entry_effect_desc');
		$data['entry_duration'] 			= $this->language->get('entry_duration');
		$data['entry_duration_desc'] 		= $this->language->get('entry_duration_desc');
		$data['entry_delay'] 				= $this->language->get('entry_delay');
		$data['entry_delay_desc'] 			= $this->language->get('entry_delay_desc');
		
		//Tabs Advanced
		$data['entry_pretext'] 				= $this->language->get('entry_pretext');
		$data['entry_pretext_desc'] 		= $this->language->get('entry_pretext_desc');
		$data['entry_posttext'] 			= $this->language->get('entry_posttext');
		$data['entry_posttext_desc'] 		= $this->language->get('entry_posttext_desc');
		// Validate
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
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();
		foreach($data['languages'] as $language){
			$name = 'module_description['.$language['language_id']."]['head_name']";
			if (isset($this->error[$name])) {
				$data['error_head_name'] = $this->error[$name];
				break;
			} else {
				$data['error_head_name'] = '';
			}
		}

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
				'href' => $this->url->link('module/so_deals', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/so_deals', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/so_deals', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/so_deals', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		$data['token'] = $this->session->data['token'];
		
		//Validation
		if (isset($this->request->post['module_description'])) {
			$data['module_description'] = $this->request->post['module_description'];
		} elseif (!empty($module_info)) {
			$data['module_description'] = $module_info['module_description'];
		} else {
			$data['module_description'] = array();
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
		if (isset($this->request->post['head_name'])) {
			$data['head_name'] = $this->request->post['head_name'];
		} elseif (!empty($module_info)) {
			$data['head_name'] = $module_info['head_name'];
		} else {
			$data['head_name'] = '';
		}
		if (isset($this->request->post['disp_title_module'])) {
			$data['disp_title_module'] = $this->request->post['disp_title_module'];
		} elseif (!empty($module_info) && isset($module_info['disp_title_module'])) {
			$data['disp_title_module'] = $module_info['disp_title_module'];
		} else {
			$data['disp_title_module'] = 1;
		}

		// config class suffix
		if (isset($this->request->post['class_suffix'])) {
			$data['class_suffix'] = $this->request->post['class_suffix'];
		} elseif (!empty($module_info)) {
			$data['class_suffix'] = $module_info['class_suffix'];
		} else {
			$data['class_suffix'] = '';
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
		
		if (isset($this->error['source_limit'])) {
			$data['error_source_limit'] = $this->error['source_limit'];
		} else {
			$data['error_source_limit'] = '';
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
		
		if (isset($this->error['margin'])) {
			$data['error_margin'] = $this->error['margin'];
		} else {
			$data['error_margin'] = '';
		}
		
		if (isset($this->error['slideBy'])) {
			$data['error_slideBy'] = $this->error['slideBy'];
		} else {
			$data['error_slideBy'] = '';
		}
		
		if (isset($this->error['autoplayTimeout'])) {
			$data['error_autoplayTimeout'] = $this->error['autoplayTimeout'];
		} else {
			$data['error_autoplayTimeout'] = '';
		}
		
		if (isset($this->error['autoplaySpeed'])) {
			$data['error_autoplaySpeed'] = $this->error['autoplaySpeed'];
		} else {
			$data['error_autoplaySpeed'] = '';
		}
		
		if (isset($this->error['smartSpeed'])) {
			$data['error_smartSpeed'] = $this->error['smartSpeed'];
		} else {
			$data['error_smartSpeed'] = '';
		}
		
		if (isset($this->error['startPosition'])) {
			$data['error_startPosition'] = $this->error['startPosition'];
		} else {
			$data['error_startPosition'] = '';
		}
		
		if (isset($this->error['dotsSpeed'])) {
			$data['error_dotsSpeed'] = $this->error['dotsSpeed'];
		} else {
			$data['error_dotsSpeed'] = '';
		}
		
		if (isset($this->error['navSpeed'])) {
			$data['error_navSpeed'] = $this->error['navSpeed'];
		} else {
			$data['error_navSpeed'] = '';
		}
		
		if (isset($this->error['duration'])) {
			$data['error_duration'] = $this->error['duration'];
		} else {
			$data['error_duration'] = '';
		}
		
		if (isset($this->error['delay'])) {
			$data['error_delay'] = $this->error['delay'];
		} else {
			$data['error_delay'] = '';
		}
		//----------------------------------General---------------------------------------------
		
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
		
		if (isset($this->request->post['nb_column4'])) {
			$data['nb_column4'] = $this->request->post['nb_column4'];
		} elseif (!empty($module_info)) {
			$data['nb_column4'] = $module_info['nb_column4'];
		} else {
			$data['nb_column4'] = '';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '1';
		}

		//-------------------------------------Source option-----------------------------------------
		//Category
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
		
		
		//Child category
		if (isset($this->request->post['child_category'])) {
			$data['child_category'] = $this->request->post['child_category'];
		} elseif (!empty($module_info)) {
			$data['child_category'] = $module_info['child_category'];
		} else {
			$data['child_category'] = '1';
		}
		
		//Category depth
		if (isset($this->request->post['category_depth'])) {
			$data['category_depth'] = $this->request->post['category_depth'];
		} elseif (!empty($module_info)) {
			$data['category_depth'] = $module_info['category_depth'];
		} else {
			$data['category_depth'] = '1';
		}
		
		//Product order by
		$data['product_sorts'] = array(
			'pd_name'  => 'Name',
			'p_model'  => 'Model',
			'p_price'  => 'Price',
			'p_quantity' => 'Quantity',
			'rating' => 'Rating',
			'p_sort_order' => 'Sort Order',
			'p_date_added' => 'Date Add'
		);
		if (isset($this->request->post['product_sort'])) {
			$data['product_sort'] = $this->request->post['product_sort'];
		} elseif (!empty($module_info)) {
			$data['product_sort'] = $module_info['product_sort'];
		} else {
			$data['product_sort'] = 'pb.name';
		}
		
		//Product order direction
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
		
		//Count
		if (isset($this->request->post['source_limit'])) {
			$data['source_limit'] = $this->request->post['source_limit'];
		} elseif (!empty($module_info)) {
			$data['source_limit'] = $module_info['source_limit'];
		} else {
			$data['source_limit'] = '6';
		}
		
		
		//-------------------------------------Items option-----------------------------------------
		//Display title
		if (isset($this->request->post['display_title'])) {
			$data['display_title'] = $this->request->post['display_title'];
		} elseif (!empty($module_info)) {
			$data['display_title'] = $module_info['display_title'];
		} else {
			$data['display_title'] = '1';
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
		
		//Title Maxlength
		if (isset($this->request->post['title_maxlength'])) {
			$data['title_maxlength'] = $this->request->post['title_maxlength'];
		} elseif (!empty($module_info)) {
			$data['title_maxlength'] = $module_info['title_maxlength'];
		} else {
			$data['title_maxlength'] = '50';
		}
		
		//Display Description
		if (isset($this->request->post['display_description'])) {
			$data['display_description'] = $this->request->post['display_description'];
		} elseif (!empty($module_info)) {
			$data['display_description'] = $module_info['display_description'];
		} else {
			$data['display_description'] = '1';
		}
		
		//Description Maxlength
		if (isset($this->request->post['description_maxlength'])) {
			$data['description_maxlength'] = $this->request->post['description_maxlength'];
		} elseif (!empty($module_info)) {
			$data['description_maxlength'] = $module_info['description_maxlength'];
		} else {
			$data['description_maxlength'] = '100';
		}

		//-------------------------------------Images option-----------------------------------------
		if (isset($this->request->post['product_image'])) {
			$data['product_image'] = $this->request->post['product_image'];
		} elseif (!empty($module_info)) {
			$data['product_image'] = $module_info['product_image'];
		} else {
			$data['product_image'] = '1';
		}


		//-------------------------------------Effect option-----------------------------------------
		//Margin
		if (isset($this->request->post['margin'])) {
			$data['margin'] = $this->request->post['margin'];
		} elseif (!empty($module_info)) {
			$data['margin'] = $module_info['margin'];
		} else {
			$data['margin'] = '5';
		}
		
		//SlideBy Item
		if (isset($this->request->post['slideBy'])) {
			$data['slideBy'] = $this->request->post['slideBy'];
		} elseif (!empty($module_info)) {
			$data['slideBy'] = $module_info['slideBy'];
		} else {
			$data['slideBy'] = '1';
		}
		
		//Auto Play 
		if (isset($this->request->post['autoplay'])) {
			$data['autoplay'] = $this->request->post['autoplay'];
		} elseif (!empty($module_info)) {
			$data['autoplay'] = $module_info['autoplay'];
		} else {
			$data['autoplay'] = '0';
		}
		
		//Auto Interval Timeout
		if (isset($this->request->post['autoplayTimeout'])) {
			$data['autoplayTimeout'] = $this->request->post['autoplayTimeout'];
		} elseif (!empty($module_info)) {
			$data['autoplayTimeout'] = $module_info['autoplayTimeout'];
		} else {
			$data['autoplayTimeout'] = '5000';
		}
		
		//Pause On Hover
		if (isset($this->request->post['autoplayHoverPause'])) {
			$data['autoplayHoverPause'] = $this->request->post['autoplayHoverPause'];
		} elseif (!empty($module_info)) {
			$data['autoplayHoverPause'] = $module_info['autoplayHoverPause'];
		} else {
			$data['autoplayHoverPause'] = '0';
		}
		
		//Auto Play Speed
		if (isset($this->request->post['autoplaySpeed'])) {
			$data['autoplaySpeed'] = $this->request->post['autoplaySpeed'];
		} elseif (!empty($module_info)) {
			$data['autoplaySpeed'] = $module_info['autoplaySpeed'];
		} else {
			$data['autoplaySpeed'] = '1000';
		}
		
		//Smart Speed
		if (isset($this->request->post['smartSpeed'])) {
			$data['smartSpeed'] = $this->request->post['smartSpeed'];
		} elseif (!empty($module_info)) {
			$data['smartSpeed'] = $module_info['smartSpeed'];
		} else {
			$data['smartSpeed'] = '1000';
		}
		
		//Start Position Item
		if (isset($this->request->post['startPosition'])) {
			$data['startPosition'] = $this->request->post['startPosition'];
		} elseif (!empty($module_info)) {
			$data['startPosition'] = $module_info['startPosition'];
		} else {
			$data['startPosition'] = '0';
		}
		
		//Mouse Drag
		if (isset($this->request->post['mouseDrag'])) {
			$data['mouseDrag'] = $this->request->post['mouseDrag'];
		} elseif (!empty($module_info)) {
			$data['mouseDrag'] = $module_info['mouseDrag'];
		} else {
			$data['mouseDrag'] = '1';
		}
		
		//Touch Drag
		if (isset($this->request->post['touchDrag'])) {
			$data['touchDrag'] = $this->request->post['touchDrag'];
		} elseif (!empty($module_info)) {
			$data['touchDrag'] = $module_info['touchDrag'];
		} else {
			$data['touchDrag'] = '1';
		}
		
		//Pull Drag
		if (isset($this->request->post['pullDrag'])) {
			$data['pullDrag'] = $this->request->post['pullDrag'];
		} elseif (!empty($module_info)) {
			$data['pullDrag'] = $module_info['pullDrag'];
		} else {
			$data['pullDrag'] = '1';
		}
		
		//button page
		$data['button_pages'] = array(
			'top' => "Top",
			'under' => "Under",
		);
		if (isset($this->request->post['button_page'])) {
			$data['button_page'] = $this->request->post['button_page'];
		} elseif (!empty($module_info)) {
			$data['button_page'] = $module_info['button_page'];
		} else {
			$data['button_page'] = '1';
		}
		
		//Show Pagination
		if (isset($this->request->post['dots'])) {
			$data['dots'] = $this->request->post['dots'];
		} elseif (!empty($module_info)) {
			$data['dots'] = $module_info['dots'];
		} else {
			$data['dots'] = '1';
		}
		
		//Pagination Speed
		if (isset($this->request->post['dotsSpeed'])) {
			$data['dotsSpeed'] = $this->request->post['dotsSpeed'];
		} elseif (!empty($module_info)) {
			$data['dotsSpeed'] = $module_info['dotsSpeed'];
		} else {
			$data['dotsSpeed'] = '500';
		}
		
		//Show Navigation
		if (isset($this->request->post['navs'])) {
			$data['navs'] = $this->request->post['navs'];
		} elseif (!empty($module_info)) {
			$data['navs'] = $module_info['navs'];
		} else {
			$data['navs'] = '1';
		}
		//Navigation Speed
		if (isset($this->request->post['navSpeed'])) {
			$data['navSpeed'] = $this->request->post['navSpeed'];
		} elseif (!empty($module_info)) {
			$data['navSpeed'] = $module_info['navSpeed'];
		} else {
			$data['navSpeed'] = '500';
		}
		//Effect 
		$data['effects'] = array(
			'none' 			=> 'None',
			'fadeIn' 		=> 'Fade In',
			'zoomIn' 		=> 'Zoom In',
			'zoomOut' 		=> 'Zoom Out',
			'slideLeft'  	=> 'Slide Left',
			'slideRight' 	=> 'Slide Right',
			'slideTop' 		=> 'Slide Top',
			'slideBottom' 	=> 'Slide Bottom',
			'flip'			=> 'Flip',
			'flipInX' 		=> 'Flip in Horizontal',
			'flipInY' 		=> 'Flip in Vertical',
			'starwars'		=> 'Star war',
			'bounceIn' 		=> 'Bounce In',
			'bounceInUp' 	=> 'Bounce In Up',
			'bounceInDown' 	=> 'Bounce In Down',
			'pageTop'		=> 'Page Top',
			'pageBottom' 	=> 'Page Bottom',
			'starwars'		=> 'Star Wars'
		);
		if (isset($this->request->post['effects'])) {
			$data['effect'] = $this->request->post['effect'];
		} elseif (!empty($module_info)) {
			$data['effect'] = $module_info['effect'];
		} else {
			$data['effect'] = 'starwars';
		}
		
		// Duration
		if (isset($this->request->post['duration'])) {
			$data['duration'] = $this->request->post['duration'];
		} elseif (!empty($module_info)) {
			$data['duration'] = $module_info['duration'];
		} else {
			$data['duration'] = '800';
		}
		
		// Delay
		if (isset($this->request->post['delay'])) {
			$data['delay'] = $this->request->post['delay'];
		} elseif (!empty($module_info)) {
			$data['delay'] = $module_info['delay'];
		} else {
			$data['delay'] = '500';
		}
		
		//-------------------------------------Advanced-----------------------------------------
		//Pretext 
		if (isset($this->request->post['pretext'])) {
			$data['pretext'] = $this->request->post['pretext'];
		} elseif (!empty($module_info)) {
			$data['pretext'] = $module_info['pretext'];
		} else {
			$data['pretext'] = '';
		}
		
		//Posttext 
		if (isset($this->request->post['posttext'])) {
			$data['posttext'] = $this->request->post['posttext'];
		} elseif (!empty($module_info)) {
			$data['posttext'] = $module_info['posttext'];
		} else {
			$data['posttext'] = '';
		}
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/so_deals.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/so_deals')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		$this->load->model('localisation/language');
		$languages = $this->model_localisation_language->getLanguages();

		foreach($languages as $language){
			$module_description = $this->request->post['module_description'];
			if ((utf8_strlen($module_description[$language['language_id']]['head_name']) < 3) || (utf8_strlen($module_description[$language['language_id']]['head_name']) > 64)) {
				$this->error['module_description['.$language['language_id']."]['head_name']"] = $this->language->get('error_head_name');
			}
		}

		if ($this->request->post['category'] == null) {
			$this->error['category'] = $this->language->get('error_category');
		}
		
		if (!filter_var($this->request->post['category_depth'],FILTER_VALIDATE_INT) || $this->request->post['category_depth'] < 0) {
			$this->error['category_depth'] = $this->language->get('error_category_depth');
		}
		if ($this->request->post['source_limit'] != '0' && !filter_var($this->request->post['source_limit'],FILTER_VALIDATE_INT) || $this->request->post['source_limit'] < 0) {
			$this->error['source_limit'] = $this->language->get('error_source_limit');
		}
		
		if ($this->request->post['title_maxlength'] != '0' && !filter_var($this->request->post['title_maxlength'],FILTER_VALIDATE_INT) || $this->request->post['title_maxlength'] < 0) {
			
			$this->error['title_maxlength'] = $this->language->get('error_title_maxlength');
		}
		
		if ($this->request->post['description_maxlength'] != '0' && !filter_var($this->request->post['description_maxlength'],FILTER_VALIDATE_INT) || $this->request->post['description_maxlength'] < 0) {
			$this->error['description_maxlength'] = $this->language->get('error_description_maxlength');
		}
		
		if (!filter_var($this->request->post['margin'],FILTER_VALIDATE_INT) || $this->request->post['margin'] < 0) {
			$this->error['margin'] = $this->language->get('error_margin');
		}
		
		if (!filter_var($this->request->post['slideBy'],FILTER_VALIDATE_INT) || $this->request->post['slideBy'] < 0) {
			$this->error['slideBy'] = $this->language->get('error_slideBy');
		}
		
		if (!filter_var($this->request->post['autoplayTimeout'],FILTER_VALIDATE_INT) || $this->request->post['autoplayTimeout'] < 0) {
			$this->error['autoplayTimeout'] = $this->language->get('error_autoplayTimeout');
		}
		
		if (!filter_var($this->request->post['autoplaySpeed'],FILTER_VALIDATE_INT) || $this->request->post['autoplaySpeed'] < 0) {
			$this->error['autoplaySpeed'] = $this->language->get('error_autoplaySpeed');
		}
		
		if (!filter_var($this->request->post['smartSpeed'],FILTER_VALIDATE_INT) || $this->request->post['smartSpeed'] < 0) {
			$this->error['smartSpeed'] = $this->language->get('error_smartSpeed');
		}
		
		if ($this->request->post['startPosition'] != '0' && !filter_var($this->request->post['startPosition'],FILTER_VALIDATE_INT) || $this->request->post['startPosition'] < 0) {
			$this->error['startPosition'] = $this->language->get('error_startPosition');
		}
		
		if (!filter_var($this->request->post['dotsSpeed'],FILTER_VALIDATE_INT) || $this->request->post['dotsSpeed'] < 0) {
			$this->error['dotsSpeed'] = $this->language->get('error_dotsSpeed');
		}
		
		if (!filter_var($this->request->post['navSpeed'],FILTER_VALIDATE_INT) || $this->request->post['navSpeed'] < 0) {
			$this->error['navSpeed'] = $this->language->get('error_navSpeed');
		}
		
		if (!filter_var($this->request->post['duration'],FILTER_VALIDATE_INT) || $this->request->post['duration'] < 0) {
			$this->error['duration'] = $this->language->get('error_duration');
		}
		
		if (!filter_var($this->request->post['delay'],FILTER_VALIDATE_INT) || $this->request->post['delay'] < 0) {
			$this->error['delay'] = $this->language->get('error_delay');
		}
		if (!filter_var($this->request->post['width'],FILTER_VALIDATE_FLOAT) || $this->request->post['width'] < 0) {
			$this->error['width'] = $this->language->get('error_width');
		}
		if (!filter_var($this->request->post['height'],FILTER_VALIDATE_FLOAT) || $this->request->post['height'] < 0) {
			$this->error['height'] = $this->language->get('error_height');
		}

		return !$this->error;
	}
	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$field_product_tabs = array(
				'pd_name'  => 'Name',
				'p_model'  => 'Model',
				'p_price'  => 'Price',
				'p_quantity' => 'Quantity',
				'rating' => 'Rating',
				'p_sort_order' => 'Sort Order',
				'p_date_added' => 'Date Add'
			);

			

			foreach ($field_product_tabs as $option_id => $option_value) {
				$json[] = array(
					'product_id' => $option_id,
					'name'        => strip_tags(html_entity_decode($option_value, ENT_QUOTES, 'UTF-8'))
				);
			}
		}
		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}