<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use chriskacerguis\RestServer\RestController;

class Mahasiswa extends RestController {

    function __construct()
    {
        // Construct the parent class
        parent::__construct();
        $this->load->model('m_mahasiswa');

        $this->methods['index_get']['limit'] = 20;
    }

    function index_get(){
        $id = $this->get('id');
        if(empty($id)) $mahasiswa = $this->m_mahasiswa->get_mahasiswa();
        else $mahasiswa = $this->m_mahasiswa->get_mahasiswa($id);

        if($mahasiswa) {
            $this->response([
                'status' => true,
                'data' => $mahasiswa
            ], 200);
        } else {
            $this->response([
                'status' => false,
                'message' => 'Data not found!'
            ], 404);
        }
    }

    function index_delete() {
        $id = $this->delete('id');

        if(empty($id)) {
            $this->response([
                'status' => false,
                'message' => 'Provide an ID!'
            ], 400);
        } else {
            $delete = $this->m_mahasiswa->del_mahasiswa($id);
            $this->response([
                'status' => $delete['status'],
                'message' => $delete['message']
            ], 200);
        }
    }

    function index_post() {
        $data = [
            'nrp' => $this->post('nrp'),
            'nama' => $this->post('nama'),
            'email' => $this->post('email'),
            'jurusan' => $this->post('jurusan')
        ];

        if($this->m_mahasiswa->add_mahasiswa($data) > 0) {
            $this->response([
                'status' => true,
                'message' => 'Data has been created!'
            ], 201);
        } else {
            $this->response([
                'status' => false,
                'message' => 'Failed to create new data!'
            ], 400);
        }
    }

    function index_put() {
        $id = $this->put('id');
        $data = [
            'nrp' => $this->put('nrp'),
            'nama' => $this->put('nama'),
            'email' => $this->put('email'),
            'jurusan' => $this->put('jurusan')
        ];

        if($this->m_mahasiswa->upd_mahasiswa($data,$id) > 0) {
            $this->response([
                'status' => true,
                'message' => 'Data has been updated!'
            ], 200);
        } else {
            $this->response([
                'status' => false,
                'message' => 'Failed to update data!'
            ], 400);
        }
    }
}