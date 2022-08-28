<?php

class ApiModel extends CI_Model
{

    private $limit = 6;

    public function getDepartments()
    {
        return $this->db->get('departments')->result();
    }
    public function getLectures($id)
    {
        return $this->db->where('department_id', $id)->get('lectures')->result();
    }

    public function save_data($data, $table)
    {
        return $this->db->insert($table, $data);
    }

    public function getDataByID($where, $table)
    {
        return $this->db->where($where)->get($table)->row();
    }

    public function updateDataByID($where, $data, $table)
    {
        return $this->db->where($where)->update($table, $data);
    }

    public function getExams($page = 1)
    {
        $total_item_count = $this->db->join('departments', 'departments.id = exams.department_id')->join('lectures', 'lectures.id = exams.lecture_id')->select("exams.*")->where('exams.status', 1)->count_all_results('exams');
        $total_page = ceil($total_item_count / $this->limit);
        $start = ($page - 1) * $this->limit;
        $this->db->join('departments', 'departments.id = exams.department_id');
        $this->db->join('lectures', 'lectures.id = exams.lecture_id');
        $this->db->select('exams.*, departments.name as department_name, lectures.name as lecture_name');
        $this->db->where('exams.status', 1);
        $this->db->order_by('exams.upload_date', 'DESC');
        $this->db->limit($this->limit, $start);
        $query = $this->db->get('exams');
        return [
            "data" => $query->result(),
            "total_page" => $total_page,
            "current_page" => $page
        ];
    }

    public function search($search, $page = 1)
    {
        $this->db->join('departments', 'departments.id = exams.department_id');
        $this->db->join('lectures', 'lectures.id = exams.lecture_id');
        $this->db->select('exams.*, departments.name as department_name, lectures.name as lecture_name');
        $this->db->like('departments.name', $search);
        $this->db->or_like('lectures.name', $search);
        $this->db->where('exams.status', 1);
        $query = $this->db->get('exams')->result();
        return [
            "data" => $query,
            "current_page" => $page
        ];
    }
}
