<?php
require_once ('db.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Получение данных из формы
    $login = $_POST['login'];
    $password = $_POST['password'];

    if (empty($login) || empty($password)) {
        echo "Заполните поле";
    } else {


        // Проверка учетных данных
        $sql = "SELECT * FROM users WHERE login = '$login' AND password = '$password'";
        $result = $conn->query($conn, $sql);

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo "Hellow." . $row['login'];
            }
        } else {
            echo 'no user found';
        }
    }
}