<Team>

	<h1>{opts.teamstats.name}</h1>

	<div class="row teamdesc">

		<div class="col-md-2" >
			<img src="{opts.teamstats.crestUrl}" alt="{opts.teamstats.name}" width="150" height="150"/>
		</div>

		<div class="col-md-10" >
			<p>{opts.teamstats.area.name}</p>
			<p>{opts.teamstats.venue}</p>
			<p>{opts.teamstats.founded}</p>
		</div>
	</div>

	<div class="row">

		<div class="col-md-4" >

			<div class="col-xs-3">
				<select class="custom-select selectMargin" onchange="{_playerpos}">
					<option value="all" selected="">-----------</option>
					<option value="Goalkeeper">Goalkeeper</option>
					<option value="Defender">Defender</option>
					<option value="Midfielder">Midfielder</option>
					<option value="Attacker">Attacker</option>
				</select>
			</div>

		</div>
	</div>

	<p>Age</p>

	<div class="row">
		<div class="col-md-3" each="{player in opts.teamstats.squad}">
			<div id="{player.id}" class="card border-primary mb-3 " style="max-width: 20rem;">
				<div class="card-header">{player.name}</div>
				<div class="card-body">
					<p class="card-text">Né le {player.dateOfBirth.substr(0,10)}</p>
					<p class="card-text">Nationalité : {player.nationality}</p>
					<p class="card-text">Numéro : {player.shirtNumber}</p>
				</div>
			</div>
		</div>
	</div>

	<script>

		this._playerpos=((ev) => {
			changeCardBackgroundColor(ev.srcElement.value);
		});

		function changeCardBackgroundColor(position){

			for (var i = 0; i < opts.teamstats.squad.length; i++) {

				if(opts.teamstats.squad[i].position == position){
					document.getElementById(opts.teamstats.squad[i].id).style.backgroundColor = "#72c2ad";
				}else{
					document.getElementById(opts.teamstats.squad[i].id).style.backgroundColor = "#FFFFFF";
				}
			}
		}
		
	</script>

</Team>