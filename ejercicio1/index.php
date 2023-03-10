<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>programa de oracion</title>
    <script src="https://cdn.tailwindcss.com"></script>

</head>
<body class="w-screen h-screen bg-sky-200 flex items-center justify-center flex flex-col">
<form method="post" action="index.php" class="flex flex-col">
    <label for="oracion" class="font-bold text-2xl">Oracion</label>
    <textarea name="oracion" id="oracion" class="p-2 rounded-md" placeholder="Ingrese una oracion"></textarea>
    <br>
    <input type="submit" value="Enviar" class="p-2 rounded-2xl bg-blue-400 mt-2 text-white hover:bg-blue-500 cursor-pointer">
</form>

<?php
// Verificar si el formulario fue enviado
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $oracion = $_POST['oracion'];
    if (!isset($_POST['oracion']) || empty($_POST['oracion'])) {
        echo "<p class='text-red-500'>No ha ingresado una oracion</p>";
        exit;
    } else {
        $palabras = explode(' ', $oracion);
        echo "<p class='text-xl font-semi-bold text-slate-600 mt-5'>$oracion</p> ";
        foreach ($palabras as $palabra) {
            $primeraLetra = substr($palabra, 0, 1);
            $ultimaLetra = substr($palabra, -1, 1);
            $longitud = strlen($palabra);
            if ($longitud > 2) {
                $subPalabra = substr_replace(substr($palabra, 1, $longitud - 1), "", -1);
                $cantidadCaracteres = strlen($subPalabra);
                $caracteres = str_split($subPalabra);
                $caracterUnico = array();
                $total = 0;

                foreach ($caracteres as $caracter) {
                    if (!in_array($caracter, $caracterUnico)) {
                        array_push($caracterUnico, $caracter);
                        $total++;
                    }
                }
                $cantidadCaracteres = $total;
            } else {
                $subPalabra = "";
                $cantidadCaracteres = 0;
            }
            echo "$primeraLetra$cantidadCaracteres$ultimaLetra ";
        }
    }
}
?>

</body>
</html>

