<Main>

	<div if="{this.main}">

		<h1 class="centered">Infos Football</h1>

		<div style="display:inline-block;" each = "{el in this.competitions}">
			<button type="button" class="btn btn-primary" id="{el.id}" onclick="{_submit}">{el.name}</button> 
		</div>

		<div if="{this.showChampionshipDetails}">

			<nav class="navbar-padding navbar navbar-expand-md navbar navbar-light bg-light">
				<a class="navbar-brand" href="#">{this.title}</a>

				<div class="mx-auto order-0">
					<a class="navbar-brand mx-auto" href="#" id="classement" onclick="{_navbarSelection}">Classement</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".dual-collapse2">
						<span class="navbar-toggler-icon"></span>
					</button>
				</div>
				<div class="mx-auto order-0">
					<a class="navbar-brand mx-auto" href="#" id="resultats" onclick="{_navbarSelection}">Résultats</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".dual-collapse2">
						<span class="navbar-toggler-icon"></span>
					</button>
				</div>
				<div class="mx-auto order-0">
					<a class="navbar-brand mx-auto" href="#" id="buteurs" onclick="{_navbarSelection}">Buteurs</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".dual-collapse2">
						<span class="navbar-toggler-icon"></span>
					</button>
				</div>

			</nav>

			<hr/>

			<Spinner loading="{this.showSpinner}"></Spinner>

			<div if="{this.showStandings}">

				<Standings day="{this.compDay}" tab="{this.standingsTab}"></Standings>

			</div>

			<div if="{this.showResults}">

				<Results teamslist="{this.teamListTab}" results="{this.resultsTab}" compid="{this.competitionId}"></Results>

			</div>

			<div if="{this.showScorers}">

				<Scorers tab="{this.scorersTab}"></Scorers>

			</div>

		</div>

	</div>

	<div if="{this.team}">

		<Team teamstats="{this.teamStats}"></Team>


	</div>

	<script>

		this.mixin('serviceAjax');
		this.competitions = [];
		this.title;
		this.showSpinner = true;
		this.compDay;
		this.competitionId;

		this.standingsTab = [];
		this.scorersTab = [];
		this.resultsTab = [];
		this.teamListTab = [];
		this.teamStats = [];

		//Show/Hide
		this.main = true;
		this.team = false;

		this.showChampionshipDetails = false;
		this.showStandings = false;
		this.showResults = false;
		this.showScorers = false;

		//Utiliser fonction filter
		this.getCompetitionList()
		.then((rep) => {
			this.competitions = rep.competitions;
			this.showSpinner = false;
			this.update();
		},
		() => {
			this.competitions = [];
			this.update();
		});

		this._submit=((ev) => {

			this.showStandings = false;
			this.showResults = false;
			this.showScorers = false;

			this.showSpinner = true;
			ev.preventDefault();

			this.competitionId = ev.originalTarget.id;

			this.getCompetitionDetails(this.competitionId)
			.then((rep) => {

				this.title = rep.competition.name;
				this.compDay = rep.season.currentMatchday;
				this.standingsTab = rep.standings.filter(filterStandingType);

				//Show/Hide
				this.showSpinner = false;
				this.showChampionshipDetails = true;
				this.showStandings = true;
				this.update();

			});
		})

		this._navbarSelection=((ev) => {

			this.showSpinner = true;
			ev.preventDefault();

			switch (ev.originalTarget.id) {

				case 'classement':		

				//Hide
				this.showResults = false;
				this.showScorers = false;

				this.getCompetitionDetails(this.competitionId)
				.then((rep) => {
					this.title = rep.competition.name;
					this.compDay = rep.season.currentMatchday;
					this.standingsTab = rep.standings.filter(filterStandingType);
					
					this.showSpinner = false;
					//Show
					this.showStandings = true;
					
					this.update();
				});
				break;


				case 'resultats':

				//Hide
				this.showStandings = false;
				this.showScorers = false;

				this.getCompetitionTeamsList(this.competitionId)
				.then((rep) => {

					this.teamListTab = rep;

					this.getCompetitionMatchesDetails(this.competitionId)
					.then((rep) => {

						this.resultsTab = rep;

						this.showSpinner = false;
						//Show
						this.showResults = true;
						this.update();

					})

				});
				break;


				case 'buteurs':

				//Hide
				this.showStandings = false;
				this.showResults = false;

				this.getCompetitionScorers(this.competitionId)
				.then((rep) => {

					this.scorersTab = rep;

					console.log(rep);


					this.showSpinner = false;


					this.showScorers = true;
					this.update();
				});

				break;

			}});


		route('/team/*', (id) => {

			this.showSpinner = true;

			this.getTeamStats(id)
			.then((rep) => {

				this.teamStats = rep;


				console.log(this.teamStats);

				this.showSpinner = false;

				this.main = false;
				this.team = true;

				this.update();
			});

		})

		route('/', () => {

			this.main = true;
			this.team = false;
			this.update();

		})

		function filterStandingType(el){
			return el.type == 'TOTAL';
		}

	</script>

</Main>