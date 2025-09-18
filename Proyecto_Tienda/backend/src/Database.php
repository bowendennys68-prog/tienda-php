<?php
class Database {
    private $dataDir = __DIR__ . "/../data/";

    public function read($file) {
        $path = $this->dataDir . $file . ".json";
        if (!file_exists($path)) {
            return [];
        }
        return json_decode(file_get_contents($path), true) ?? [];
    }

    public function write($file, $data) {
        $path = $this->dataDir . $file . ".json";
        file_put_contents($path, json_encode($data, JSON_PRETTY_PRINT));
    }
}
