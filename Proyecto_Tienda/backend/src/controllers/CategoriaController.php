<?php
require_once __DIR__ . "/../Database.php";

class CategoriaController {
    private $db;

    public function __construct() {
        $this->db = new Database();
    }

    public function listar() {
        echo json_encode($this->db->read("categorias"));
    }

    public function crear($data) {
        $categorias = $this->db->read("categorias");
        $data["id"] = uniqid();
        $categorias[] = $data;
        $this->db->write("categorias", $categorias);
        echo json_encode(["success" => true]);
    }
}
