<?php
    // PHP 7
    $link = mysqli_connect("localhost", "root", "", "eleicao_db");

    $eleitor = $_POST['id_eleitor'];
    $candidato = $_POST['id_candidato'];

    $query = 'INSERT INTO voto (id_candidato, id_eleitor, data_hora) 
              VALUES ("'.$candidato.'", "'.$eleitor.'", "'.date('Y-m-d H:i:s').'")';
    $result = mysqli_query($link, $query);

    if ($result) {
        header('Location: ../home.php?res=success');
    } else {
        header('Location: ../voto.php?res=error');
    }
?>