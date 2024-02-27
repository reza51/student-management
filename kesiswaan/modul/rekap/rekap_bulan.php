<?php
include '../../../config/db.php';

$bulan = $_GET['bulan'];
$kelas = $_GET['kelas'];
$pelajaran = $_GET['pelajaran'];

// Get the number of days in the selected month
$dateString = date('Y-m-d', strtotime('2023-03-15'));
echo "<script> var date = new Date('$dateString'); </script>";

// tampilkan data absen
$qry = mysqli_query($con, "SELECT * FROM _logabsensi 
	INNER JOIN tb_siswa ON _logabsensi.id_siswa = tb_siswa.id_siswa
	WHERE MONTH(tgl_absen) = '$bulan' AND _logabsensi.id_mengajar = '$kelas'
	GROUP BY _logabsensi.id_siswa ORDER BY _logabsensi.id_siswa ASC");

// Jumlah hari dalam bulan
$tglTerakhir = date('t', strtotime(date('Y-m', strtotime("2024-$bulan-02"))));

// Format the date according to your needs
?>

 <style>
 	body{
 		font-family: Tahoma;
 	}
 </style>
 <table width="100%">
	<tr>
 		<td>
 			<img src="../assets/img/logojenpo.png" width="130">
 		</td>
		<td>
 			<center>
 				
 				<h1>
 					Student Management <br>
 					<small> SMKN 1 JENANGAN</small>
 				</h1>
 				<hr>
 				<em>
 					Jl. Niken Gandini No.98, Plampitan, Setono, Kec. Jenangan, <br> Kabupaten Ponorogo, Jawa Timur 63492, <br>
 				<b>Email : smknjenpo@yahoo.com Telp.00352481236</b> 
 				</em>
 	
 			</center>
 		</td>
 		<td>

 			<table width="100%">
</tr>
    <td colspan="2"><b style="border: 2px solid;padding: 7px;">
	KELAS (<?= isset($d['nama_kelas']) ? strtoupper($d['nama_kelas']) : 'ALL' ?>)
    </b> </td>
    <td>
    	<b style="border: 2px solid;padding: 7px;">
    		<?=$d['semester'] ?> |
      <?=$d['tahun_ajaran'] ?>
  </b>
  </td>
    <td rowspan="5">
    	<ul>
    		<li>H= Hadir</li>
    		<li>S = Sakit</li>
    		<li>I = Izin</li>
    		<li>T = Terlambat</li>
    		<li>A = Absen</li>
    		<li>C = Cabut/Bolos</li>
    	</ul>
<!-- <p>H= Hadir</p>
<p>I = Izin</p>
<p>S = Sakit</p>
<p>A = Absesn    </p> -->
</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <!--<tr>
    <td>Nama Guru </td>
    <td>:</td>
    <td><?=$d['nama_guru'] ?></td>
  </tr>
  <tr>
    <td>Minatbakat </td>
    <td>:</td>
    <td><?=$d['mapel'] ?></td>
  </tr>-->
</table>
 		</td>
 	</tr>
 </table>

<hr style="height: 3px;border: 1px solid;">


<table width="100%" border="1" cellpadding="2" style="border-collapse: collapse;">
  <tr>
    <td rowspan="2" bgcolor="#EFEBE9" align="center">NO</td>
    <td rowspan="2" bgcolor="#EFEBE9">NAMA SISWA</td>
    <td rowspan="2" bgcolor="#EFEBE9" align="center">L/P</td>
    <td colspan="<?=$Bulan;?>" style="padding: 8px;"><b>Bulan :</b></td>
	<td colspan="5" align="center" bgcolor="#EFEBE9">KETERANGAN</td>
  </tr>
  <tr>
	<?php 
	for ($i = 1; $i <=$t ; $i++) {
	echo "<td bgcolor='#EFEBE9' align='center'>".$i."</td>";
	}


	?> 
	<td bgcolor="#FFC107" align="center">S</td>
	<td bgcolor="#4CAF50" align="center">I</td>
	<td bgcolor="#D50000" align="center">A</td>
	<td bgcolor="#76FF03" align="center">T</td>
	<td bgcolor="#9C27B0" align="center">C</td>
 
  </tr>
  	<?php 
			// tampilkan absen siswa
			$no=1;
			foreach ($qry as $ds) {
				 $warna = ($no % 2 == 1) ? "#ffffff" : "#f0f0f0";

				?>
			<tr>

  <tr bgcolor="<?=$warna; ?>">
    <td align="center"><?=$no++; ?></td>
    <td><?=$ds['nama_siswa'];?></td>
    <td align="center"><?=$ds['jk'];?></td>
		<?php 
		for ($i = 1; $i <=$tglTerakhir ; $i++) {


		?>
		<td align="center" bgcolor="white">
		<?php 
		$ket = mysqli_query($con,"SELECT * FROM _logabsensi
		INNER JOIN tb_mengajar ON _logabsensi.id_mengajar=tb_mengajar.id_mengajar
		INNER JOIN tb_semester ON tb_mengajar.id_semester=tb_semester.id_semester
		INNER JOIN tb_thajaran ON tb_mengajar.id_thajaran=tb_thajaran.id_thajaran
		WHERE DAY(tgl_absen)='$i' AND id_siswa='$ds[id_siswa]' AND _logabsensi.id_mengajar='$_GET[pelajaran]' AND MONTH(tgl_absen)='$bulan' AND tb_mengajar.id_mkelas='$_GET[kelas]'  AND tb_thajaran.status=1 AND tb_semester.status=1 GROUP BY DAY(tgl_absen) ");
		foreach ($ket as $h)
			
			// echo $h['ket'];
		if ($h['ket']=='H') {
				echo "<b style='color:#2196F3;'>H</b>";				
			}elseif ($h['ket']=='I') {
				echo "<b style='color:#4CAF50;'>I</b>";
			}elseif ($h['ket']=='S') {
				echo "<b style='color:#FFC107;'>S</b>";
			}elseif($h['ket']=='A'){
				echo "<b style='color:#D50000;'>A</b>";
			}elseif ($h['ket']=='T') {
				echo "<b style='color:#76FF03;'>T</b>";
			}
			else{
				echo "<b style='color:#9C27B0;'>C</b>";
			}
			
		

		 ?>
</td>
		
		<?php


		}

		?>
<td align="center" style="font-weight: bold;">
<?php 
$sakit = mysqli_fetch_array(mysqli_query($con,"SELECT COUNT(ket) AS sakit FROM _logabsensi
	INNER JOIN tb_mengajar ON _logabsensi.id_mengajar=tb_mengajar.id_mengajar
		INNER JOIN tb_semester ON tb_mengajar.id_semester=tb_semester.id_semester
		INNER JOIN tb_thajaran ON tb_mengajar.id_thajaran=tb_thajaran.id_thajaran
 WHERE _logabsensi.id_siswa='$ds[id_siswa]' and _logabsensi.ket='S' and MONTH(tgl_absen)='$bulan' and _logabsensi.id_mengajar='$_GET[pelajaran]' AND tb_mengajar.id_mkelas='$_GET[kelas]'  AND tb_thajaran.status=1 AND tb_semester.status=1 "));
echo $sakit['sakit'];

?>
</td>
<td align="center" style="font-weight: bold;">
<?php 
$izin = mysqli_fetch_array(mysqli_query($con,"SELECT COUNT(ket) AS izin FROM _logabsensi
	INNER JOIN tb_mengajar ON _logabsensi.id_mengajar=tb_mengajar.id_mengajar
		INNER JOIN tb_semester ON tb_mengajar.id_semester=tb_semester.id_semester
		INNER JOIN tb_thajaran ON tb_mengajar.id_thajaran=tb_thajaran.id_thajaran
 WHERE _logabsensi.id_siswa='$ds[id_siswa]' and _logabsensi.ket='I' and MONTH(tgl_absen)='$bulan' and _logabsensi.id_mengajar='$_GET[pelajaran]' AND tb_mengajar.id_mkelas='$_GET[kelas]'  AND tb_thajaran.status=1 AND tb_semester.status=1 "));
echo $izin['izin'];

?>
</td align="center" style="font-weight: bold;">
<td align="center" style="font-weight: bold;">
	<?php 
$alfa = mysqli_fetch_array(mysqli_query($con,"SELECT COUNT(ket) AS alfa FROM _logabsensi
	INNER JOIN tb_mengajar ON _logabsensi.id_mengajar=tb_mengajar.id_mengajar
		INNER JOIN tb_semester ON tb_mengajar.id_semester=tb_semester.id_semester
		INNER JOIN tb_thajaran ON tb_mengajar.id_thajaran=tb_thajaran.id_thajaran
 WHERE _logabsensi.id_siswa='$ds[id_siswa]' and _logabsensi.ket='A' and MONTH(tgl_absen)='$bulan' and _logabsensi.id_mengajar='$_GET[pelajaran]' AND tb_mengajar.id_mkelas='$_GET[kelas]'  AND tb_thajaran.status=1 AND tb_semester.status=1 "));
echo $alfa['alfa'];

?>
</td>

<td align="center" style="font-weight: bold;">
	<?php 
$tlambat = mysqli_fetch_array(mysqli_query($con,"SELECT COUNT(ket) AS tlambat FROM _logabsensi
	INNER JOIN tb_mengajar ON _logabsensi.id_mengajar=tb_mengajar.id_mengajar
		INNER JOIN tb_semester ON tb_mengajar.id_semester=tb_semester.id_semester
		INNER JOIN tb_thajaran ON tb_mengajar.id_thajaran=tb_thajaran.id_thajaran
 WHERE _logabsensi.id_siswa='$ds[id_siswa]' and _logabsensi.ket='T' and MONTH(tgl_absen)='$bulan' and _logabsensi.id_mengajar='$_GET[pelajaran]' AND tb_mengajar.id_mkelas='$_GET[kelas]'  AND tb_thajaran.status=1 AND tb_semester.status=1 "));
echo $tlambat['tlambat'];

?>
</td>
<td align="center" style="font-weight: bold;">
	<?php 
$cabut = mysqli_fetch_array(mysqli_query($con,"SELECT COUNT(ket) AS cabut FROM _logabsensi
	INNER JOIN tb_mengajar ON _logabsensi.id_mengajar=tb_mengajar.id_mengajar
		INNER JOIN tb_semester ON tb_mengajar.id_semester=tb_semester.id_semester
		INNER JOIN tb_thajaran ON tb_mengajar.id_thajaran=tb_thajaran.id_thajaran
 WHERE _logabsensi.id_siswa='$ds[id_siswa]' and _logabsensi.ket='C' and MONTH(tgl_absen)='$bulan' and _logabsensi.id_mengajar='$_GET[pelajaran]' AND tb_mengajar.id_mkelas='$_GET[kelas]'  AND tb_thajaran.status=1 AND tb_semester.status=1 "));
echo $cabut['cabut'];

?>
</td>

   
  </tr>
<?php } ?>
</table>

<p></p>
<table width="100%">
	<tr>
	<!-- 	<td align="left">
			<p>
				Mengetahui
			</p>
			<p>
				Kepala Sekolah
				<br>
				<br>
				<br>
				<br>
				<br>
				-----------------------------
			</p>
		</td> -->
		<td align="right">
			<p>
				Ponorogo, <?php echo date('d-F-Y'); ?>
			</p>
			<p>
				Kepala Sekolah
				<br>
				<br>
				<br>
				<br>
				<br>
				SUJONO S.Pd <br>
				----------------------<br>
				NIP.1974113845738948
			</p>
		</td>
	</tr>
</table>

<script>
	window.print();
</script>