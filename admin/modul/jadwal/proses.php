<?php 

if (isset($_POST['editJadwal'])) {

		$editjadwal= mysqli_query($con,"UPDATE tb_mengajar SET jam_mengajar='$_POST[jam]',id_mkelas='$_POST[kelas]' WHERE id_mengajar='$_POST[id]' ");
		if ($editjadwal) {
				echo "
				<script type='text/javascript'>
				setTimeout(function () { 

				swal('($_POST[nama]) ', 'Berhasil di Ubah', {  ?>
				icon : 'success',
				buttons: {        			
				confirm: {
				className : 'btn btn-success'
				}
				},
				});    
				},10);  
				window.setTimeout(function(){ 
				window.location.replace('?page=jadwal');
				} ,3000);   
				</script>";
		}
  }
