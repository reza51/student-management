	<?php 

$edit = mysqli_query($con,"SELECT * FROM tb_jurnal WHERE id_jurnal='$_GET[id]' ");
foreach ($edit as $d)?>
<div class="page-inner">
          <div class="page-header">
            <h4 class="page-title">Jurnal</h4>
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
                <a href="#">Data Jurnal</a>
              </li>
              <li class="separator">
                <i class="flaticon-right-arrow"></i>
              </li>
              <li class="nav-item">
                <a href="#">Edit Jurnal</a>
              </li>
            </ul>
          </div>
          <div class="row">
                <div class="col-lg-8">
                  <div class="card">
                    <div class="card-header d-flex align-items-center">
                      <h3 class="h4">Form Edit Jurnal</h3>
                    </div>
                    <div class="card-body">

								
	<form action="?page=jurnal&act=proses" method="post" enctype="multipart/form-data">
		<input name="id" type="hidden" value="<?=$d['id_jurnal'] ?>">	

<table cellpadding="3" style="font-weight: bold;">
<tr>
    <td>Nama Pelatih </td>
    <td>:</td>
    <td>
    	<select name="nama" class="form-control">
    		<option value="">- Pilih -</option>
        <?php 
												$guru = mysqli_query($con,"SELECT * FROM tb_guru WHERE status='P' ORDER BY id_guru ASC");
												foreach ($guru as $g) {
													echo "<option value='$g[id_guru]'>$g[nama_pelatih]</option>";
												}
												 ?>
    	
    	</select>
    </td>
  </tr> 
  <tr>
    <td>KELAS</td>
    <td>:</td>
    <td>
    	<select name="idm" class="form-control">
    		<option value="">- Pilih -</option>
        <?php 
												$kls = mysqli_query($con,"SELECT * FROM tb_mkelas ORDER BY id_mkelas ASC");
												foreach ($kls as $g) {
													echo "<option value='$g[id_mkelas]'>$g[nama_kelas]</option>";
												}
												 ?>
    	
    	</select>
    </td>
  </tr> 
  <tr>
    <td>NIS</td>
    <td>:</td>
    <td><input name="nis" type="text" class="form-control" placeholder="NIS/NISN">	</td>
  </tr>
  <tr>
    <td>Tanggal Kegiatan</td>
    <td>:</td>
    <!-- <td><input type="text" class="form-control" name="tempat" placeholder="Tempat Lahir"></td>
    <td>/</td> -->
    <td><input type="date" class="form-control" name="tgl" placeholder="Tanggal Kegiatan"></td>
  </tr>

    <tr>
    <td>Minat/Bakat </td>
    <td>:</td>
    <td>
    	<select name="minat" class="form-control">
    		<option value="">- Pilih -</option>
        <?php 
												$mapel = mysqli_query($con,"SELECT * FROM tb_master_mapel ORDER BY id_mapel ASC");
												foreach ($mapel as $g) {
													echo "<option value='$g[id_mapel]'>[ $g[kode_mapel] ] $g[mapel]</option>";
												}
												 ?>
    	
    	</select>
    </td>
  </tr> 
  <tr>
    <td>Kegiatan </td>
    <td>:</td>
    <td><textarea name="kg" class="form-control"></textarea></td>
  </tr>
  <tr>
    <td>Foto Kegiatan </td>
    <td>:</td>
    <td><input type="file" class="form-control" name="foto"></td>
  </tr>
  <tr>
    <td colspan="3">
		<button name="editjurnal" type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Update</button>
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

