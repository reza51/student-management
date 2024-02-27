<div class="page-inner">
          <div class="page-header">
            <h4 class="page-title">Pelatih</h4>
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
                <a href="#">Data Pelatih</a>
              </li>
              <li class="separator">
                <i class="flaticon-right-arrow"></i>
              </li>
              <li class="nav-item">
                <a href="#">Tambah Pelatih</a>
              </li>
            </ul>
          </div>
          <div class="row">

                <div class="col-lg-8">
                  <div class="card">
                    <div class="card-header d-flex align-items-center">
                      <h3 class="h4">Form Entry Pelatih</h3>
                    </div>
                    <div class="card-body">
						<form action="?page=pelatih&act=proses" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label>NIS/NISN</label>
								<input name="nip" type="text" pattern="[0-9]*" class="form-control" placeholder="NIP/NUPTK">								
							</div>

							<div class="form-group">
								<label>Nama Pelatih</label>
								<input name="nama" type="text" class="form-control" placeholder="Nama dan Gelar">								
							</div>

							<div class="form-group">
								<label>Email</label>
								<input name="email" type="text" pattern="[a-zA-Z0-9._%+-]+@gmail\.com" class="form-control" placeholder="Email">
							</div>

							<div class="form-group">
								<p>
                <img src="../assets/img/user/ppp5.jpg" class="img-fluid rounded-circle kotak" style="height: 90px; width: 90px;">
								</p>
								<label>Foto</label>
								<input type="file" name="foto">
							</div>

							

							<div class="form-group">
								<button name="saveGuru" type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Simpan</button>
								<a href="javascript:history.back()" class="btn btn-warning"><i class="fa fa-chevron-left"></i> Batal</a>
							</div>


						</form>
</div>
</div>
</div>
</div>
</div>
