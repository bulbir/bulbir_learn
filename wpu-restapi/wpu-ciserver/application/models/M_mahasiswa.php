<?php
	class M_mahasiswa extends CI_Model {
		function get_mahasiswa($id = null) {
			if(empty($id)) $result = $this->db->get('mahasiswa')->result_array();
			else $result = $this->db->get_where('mahasiswa', array('id'=>$id))->result_array();

			return $result;
		}

		function del_mahasiswa($id) {
			$delete = $this->db->query("DELETE FROM mahasiswa WHERE id=?", array($id));

			if($delete) {
				if($this->db->affected_rows() > 0) $result = array('status'=>true, 'message'=>'Data has been deleted!');
				else $result = array('status'=>false, 'message'=>'ID not found!');
			} else $result = array('status'=>false, 'message'=>'Internal server error');

			return $result;
		}

		function add_mahasiswa($data) {
			$this->db->insert('mahasiswa',$data);
			return $this->db->affected_rows();
		}

		function upd_mahasiswa($data,$id) {
			$this->db->update('mahasiswa', $data, array('id' => $id));
			return $this->db->affected_rows();
		}
	}