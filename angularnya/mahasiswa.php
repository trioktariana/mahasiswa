 <?php  

 $connect = mysqli_connect("localhost", "root", "", "mahasiswa");  
 $output = array();  
 $query = "SELECT * FROM mahasiswa join prodi on prodi.id_prodi = mahasiswa.id_prodi join jurusan on jurusan.id_jurusan = prodi.id_jurusan order by id_mahasiswa asc";  
 $result = mysqli_query($connect, $query);  
 while($row = mysqli_fetch_array($result))  
 {  
      $hasil[] = $row;  
 }  
 echo json_encode($hasil);  
 ?>  