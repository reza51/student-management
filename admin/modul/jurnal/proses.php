<?php 

if (isset($_POST['savejurnal'])) {

        $pass= sha1($_POST['nis']);
    	$sumber = @$_FILES['foto']['tmp_name'];
		$target = '../assets/img/user/';
		$nama_gambar = @$_FILES['foto']['name'];
		$pindah = move_uploaded_file($sumber, $target.$nama_gambar);

		if ($pindah) {
		$save= mysqli_query($con,"INSERT INTO tb_jurnal VALUES(NULL,NULL,'$_POST[nis]','$_POST[tgl]','$_POST[nama]','$_POST[minat]','$_POST[kg]','$_POST[kelas]','$nama_gambar') ");
			if ($save) {
					echo "
				<script type='text/javascript'>
				setTimeout(function () { 

				swal('($_POST[nama_pelatih]) ', 'Berhasil disimpan', {
				icon : 'success',
				buttons: {        			
				confirm: {
				className : 'btn btn-success'
				}
				},
				});    
				},10);  
				window.setTimeout(function(){ 
				window.location.replace('?page=jurnal');
				} ,3000);   
				</script>";
			}
		}


  }elseif (isset($_POST['editjurnal'])) {

  		$gambar = @$_FILES['foto']['name'];
		if (!empty($gambar)) {
		move_uploaded_file($_FILES['foto']['tmp_name'],"../assets/img/user/$gambar");
		$ganti = mysqli_query($con,"UPDATE tb_jurnal SET foto='$gambar' WHERE id_jurnal='$_POST[id]' ");
		}

		$editSiswa= mysqli_query($con,"UPDATE tb_jurnal SET nama_pelatih='$_POST[nama]',tgl_jurnal='$_POST[tgl]',kelas='$_POST[kelas]',kegiatan='$_POST[kg]' WHERE id_jurnal='$_POST[id]' ");
		if ($editSiswa) {
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
				window.location.replace('?page=jurnal');
				} ,3000);   
				</script>";
		}
  }
