<Results>
	
	<h3>Résultats</h3>

	<div class="row">

		<div class="col-md-6" >

			<div class="col-xs-3">
				<label for="teamSelect">Equipe</label>
				<select id="teamSelect" class="custom-select" onchange="{_teamSelect}">
					<option value="all" selected="">-----------</option>
					<option each="{el in opts.teamslist.teams}" value="{el.id}">{el.name}</option>
				</select>
			</div>
		</div>

		<div class="col-md-6" >

			<div class="col-xs-3">
				<label for="matchDaySelect">Journée</label>
				<select id="matchDaySelect" class="custom-select" onchange="{_matchDaySelect}">
					<option value="all" selected="">-----------</option>
					<option each="{el in this.matchDaysList}" value="{el}">{el}</option>
				</select>
			</div>
		</div>

	</div>

	<div class="col-xs-3" each="{el in this.matchesList}">
		<br/>
		<p id="date" align="center"><b>{el.utcDate.substr(0,10)}</b></p>

		<table class="table">
			<tbody>
				<tr>
					<td  class="col-md-2">{el.group}</td>
					<td class="col-md-2"><a href="#team/{el.awayTeam.id}" >{el.awayTeam.name}</a></td>
					<td class="col-md-1">{el.score.fullTime.awayTeam}</td>
					<td class="col-md-1">-</td>
					<td class="col-md-1">{el.score.fullTime.homeTeam}</td>
					<td class="col-md-2"><a href="#team/{el.homeTeam.id}">{el.homeTeam.name}</a></td>
				</tr>
			</tbody>
		</table>

	</div>

	<script>

		this.mixin('serviceAjax');

		var self=this;

		this.teamId;
		this.currentMatchDay;
		this.competitionId = opts.compid;
		this.matchesList = opts.results.matches;
		this.matchDaysList = getMatchDays();

		console.log(this.matchesList);

		this._teamSelect=((ev) => {

			this.teamId = ev.srcElement.value;

			if(this.teamId == 'all'){
				this.matchesList = opts.results.matches;
				this.update();
			}else{
				this.matchesList = opts.results.matches.filter(filterByTeam);
				this.update();
			}

		});

		this._matchDaySelect = ((ev) => {

			this.currentMatchDay = ev.srcElement.value;

			if(this.currentMatchDay == 'all'){

				console.log("all");

			}else{

				console.log(this.currentMatchDay);
			}

			this.update();

		});

		function filterByTeam(el){
			return el.awayTeam.id == self.teamId || el.homeTeam.id == self.teamId;
		}

		function getMatchDays(){

			var tmp = [];
			var cpt = -1;
			for (var i = 0; i < opts.results.matches.length; i++) {
				if(opts.results.matches[i].matchday > cpt){
					cpt = opts.results.matches[i].matchday;
					tmp.push(cpt);
				}	
			}

			return tmp;
		}

	</script>

</Results>