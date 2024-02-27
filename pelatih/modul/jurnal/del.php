<?php 
$del = mysqli_query($con,"DELETE FROM tb_jurnal WHERE id_jurnal=$_GET[id]");
if ($del) {
		echo " <script>
		alert('Data telah dihapus !');
		window.location='?page=jurnal';
		</script>";	
}

 ?>