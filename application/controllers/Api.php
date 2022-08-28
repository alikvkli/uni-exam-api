<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Api extends CI_Controller
{

	public $JSON_DATA;


	public function __construct()
	{
		parent::__construct();
		$this->output->set_content_type("application/json");
		$this->output->set_header("Access-Control-Allow-Origin: *");
		$this->output->set_header("Access-Control-Allow-Methods: GET, POST,OPTIONS");
		$this->output->set_header("Access-Control-Allow-Headers: Content-Type, Content-Length, Accept-Encoding");
		$this->JSON_DATA = (array)json_decode(file_get_contents("php://input"));
		$this->load->model('apimodel', 'api');
		$this->load->helper('format');
	}

	public function getExams($page)
	{
		$query = $this->api->getExams($page);
		echo data_format_json($query);
	}

	public function search()
	{

		$search =  $this->JSON_DATA['search'];
		if (!empty($search)) {
			$query = $this->api->search($search);
			echo data_format_json($query);
		}
	}

	public function uploadfile()
	{
		$file = $_FILES['file'];
		$response  = array();
		if ($file['name']) {
			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|jpeg|png|pdf';
			$config['max_size'] = 2048;
			$this->load->library('upload', $config);
			if ($this->upload->do_upload("file")) {
				$file_type = $this->upload->data()['file_ext'];
				$file_size = $this->upload->data()['file_size'];
				$file_name = $this->upload->data()['file_name'];
				$data = array(
					'department_id' => $_POST['department'],
					'lecture_id' => $_POST['lecture'],
					'img_url' => "http://192.168.1.3/uni-exam-api/uploads/{$file_name}",
					'download_count' => 0,
					'file_type' => $file_type,
					'file_name' => $file_name,
					'file_size' => $file_size,
					'status' => 1,
					'download_url' => "http://192.168.1.3/uni-exam-api/uploads/{$file_name}",
				);
				$save = $this->api->save_data($data, "exams");
				if ($save) {
					$response = array(
						"message" => "Gönderdiğiniz dosya başarıyla yüklenmiştir.Teşekkür ederiz."
					);
				}
			} else {
				$size = $file['size'] * 0.001;
				if ($size >= $config['max_size']) {
					$max_size = $config['max_size'] * 0.001;
					$response["message"] = "Yüklenecek dosya {$max_size}Mb'dan büyük olamaz.";
				} elseif ($file['type'] != 'application/pdf' || $file['type'] != 'application/jpeg ' || $file['type'] != 'application/png' || $file['type'] != ' application/gif' || $file['type'] != 'application/jpg') {
					$response["message"] = "Sadece gif | jpg | jpeg | png | pdf formatında dosyalar yüklenebilir.";
				}
			}
		}
		echo data_format_json($response);
	}

	public function downloadFile()
	{
		$id = $this->JSON_DATA['id'];
		if (!empty($id)) {
			$where = array("id" => $id);
			$get   = $this->api->getDataByID($where, "exams");
			$data  =  array(
				"download_count" => $get->download_count + 1
			);
			$this->api->updateDataByID($where, $data, "exams");
			$response = array(
				"imgUrl" => $get->img_url,
				"filename" => $get->file_name
			);
			echo data_format_json($response);
		}
	}


	public function getDepartments()
	{
		$query = $this->api->getDepartments();
		echo data_format_json($query);
	}

	public function getLectures($id)
	{
		$query = $this->api->getLectures($id);
		echo data_format_json($query);
	}
}
