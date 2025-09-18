<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type");

require_once __DIR__ . "/../src/controllers/CategoriaController.php";

$path = $_GET['path'] ?? "";

switch ($path) {
    case "categorias":
        $controller = new CategoriaController();
        if ($_SERVER["REQUEST_METHOD"] === "GET") {
            $controller->listar();
        } elseif ($_SERVER["REQUEST_METHOD"] === "POST") {
            $data = json_decode(file_get_contents("php://input"), true);
            $controller->crear($data);
        }
        break;
    default:
        echo json_encode(["error" => "Ruta no encontrada"]);
}
