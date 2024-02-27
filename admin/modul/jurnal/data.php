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
                <a href="#">Tambah Jurnal</a>
              </li>
            </ul>
          </div>
          <div class="row">
                <div class="col-lg-12">
                  <div class="card">
                    <div class="card-header d-flex align-items-center">
                      <h3 class="h4">Form Entry Jurnal</h3>
                    </div>
                    <div class="card-body">
                 <table id="basic-datatables" class="display table table-striped table-hover" >
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>NIS/NISN</th>
                            <th>Nama Pelatih</th>
                            <th>Kelas</th>
                            <th>Kegiatan</th>
                            <th>Tanggal Kegiatan</th>
                            <th>Foto Kegiatan</th>
                        </tr>
                    </thead>  
                    <tbody>
                        <?php 
                        $no=1;
			$siswa = mysqli_query($con,"SELECT * FROM tb_jurnal
                 INNER JOIN tb_mkelas ON tb_jurnal.id_mkelas=tb_mkelas.id_mkelas
                 ORDER BY id_jurnal ASC
                ");
                        foreach ($siswa as $g) {?>
                        <tr>
                            <td><?=$no++;?>.</td>                          
                            <td><?=$g['nis'];?></td>
                            <td><?=$g['nama_pelatih'];?></td>
                            <td><?=$g['kelas'];?></td>
                            <td><?=$g['kegiatan'];?></td>
                            <td><?=$g['tgl_jurnal'];?></td>
                            <!--<td><?=$g['foto'];?></td>
                            <td><?php if ($g['status']==1) {
                                echo "<span class='badge badge-success'>Aktif</span>";
                                
                            }else {
                                echo "<span class='badge badge-danger'>Off</span>";
                            } ?></td> -->
                            <td><img src="../assets/img/user/<?=$g['foto'] ?>" width="45" height="45"></td>
                              <td>
                              <a class="btn btn-danger btn-sm" onclick="return confirm('Yakin Hapus Data ??')" href="?page=jurnal&act=del&id=<?=$g['id_siswa'] ?>"><i class="fas fa-trash"></i></a>
                            <!--<a class="btn btn-info btn-sm" href="?page=siswa&act=edit&id=<?=$g['id_siswa'] ?>"><i class="far fa-edit"></i></a> -->
                            </td>
                        </tr>
                    <?php } ?>
                    </tbody>                        
                </table>
</div>
</div>
</div>
</div>
</div>
