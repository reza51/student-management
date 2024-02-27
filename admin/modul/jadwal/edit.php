	<?php 

$edit = mysqli_query($con,"SELECT * FROM tb_mengajar 
INNER JOIN tb_master_mapel ON tb_mengajar.id_mapel=tb_master_mapel.id_mapel
INNER JOIN tb_mkelas ON tb_mengajar.id_mkelas=tb_mkelas.id_mkelas
INNER JOIN tb_guru ON tb_mengajar.id_guru=tb_guru.id_guru
WHERE id_mengajar='$_GET[id]'
");
foreach ($edit as $d)?>
<div class="page-inner">
          <div class="page-header">
            <h4 class="page-title">Jadwal</h4>
            <ul class="breadcrumbs">
              <li class="nav-home">
                <a href="#">
                  <i class="flaticon-home"></i>
                </a>
              </li>
              <li class="separator">
                <i class="flaticon-right-arrow"></i>
              </li>
              <li class="nav-item">
                <a href="#">Data Jadwal</a>
              </li>
              <li class="separator">
                <i class="flaticon-right-arrow"></i>
              </li>
              <li class="nav-item">
                <a href="#">Edit Jadwal</a>
              </li>
            </ul>
          </div>
          <div class="row">
                <div class="col-lg-8">
                  <div class="card">
                    <div class="card-header d-flex align-items-center">
                      <h3 class="h4">Form Edit Jadwal</h3>
                    </div>
                    <div class="card-body">

								
	<form action="?page=jadwal&act=proses" method="post" enctype="multipart/form-data">
		<input name="id" type="hidden" value="<?=$d['id_mengajar'] ?>">	

<table cellpadding="3" style="font-weight: bold;">
  <tr>
    <td>Nama Pelatih </td>
    <td>:</td>
    <td><input type="text" class="form-control" name="nama" value="<?=$d['nama_guru'] ?>"></td>
  </tr>
  <!--<tr>
    <td>NIS/NISN</td>
    <td>:</td>
    <td><input name="nis" type="text" pattern="[0-9]*" class="form-control" value="<?=$d['nis'] ?>" readonly>	</td>
  </tr>
  <tr>
    <td>Tempat,Tanggal Lahir </td>
    <td>:</td>
    <td><input type="text" class="form-control" name="tempat" value="<?=$d['tempat_lahir'] ?>"></td>
    <td>/</td>
    <td><input type="date" class="form-control" name="tgl" value="<?=$d['tgl_lahir'] ?>"></td>
  </tr>-->
  <tr>
    <td>Jam Mengajar </td>
    <td>:</td>
    <td>
    	<select name="jam" class="form-control">
    		<option value="07.00-09.00">07.00-09.00</option>
    		<option value="09.00-11.00">09.00-11.00</option>
        <option value="13.00-15.00">13.00-15.00</option>
        <option value="15.00-17.00">15.00-17.00</option>
    	</select>
    </td>
  </tr>
  <tr>
    <td>Kelas</td>
    <td>:</td>
	<td>
    <select class="form-control" name="kelas">
    <option>Pilih Kelas</option>
    <?php
    $sqlKelas=mysqli_query($con, "SELECT * FROM tb_mkelas
    ORDER BY id_mkelas ASC");
    while($kelas=mysqli_fetch_array($sqlKelas)){

    	if ($kelas['id_mkelas']==$d['id_mkelas']) {
    		$selected= "selected";
    		
    	}else{
    		$selected='';
    	}
    echo "<option value='$kelas[id_mkelas]' $selected>$kelas[nama_kelas]</option>";
    }
    ?>
    </select>
	</td>
  </tr>

    <tr>
    <td colspan="3">
		<button name="editJadwal" type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Update</button>
		<a href="javascript:history.back()" class="btn btn-warning"><i class="fa fa-chevron-left"></i> Batal</a>
    </td>
  </tr>
</table>
</form>							

			
					

</div>
</div>
</div>
</div>
</div>

