function makeServiceAjax(){
	var apikey="6a6435a9090845ce9cfc95331bd13b71";
	var urlBase = "http://api.football-data.org/v2/";
	var service = {
		"getCompetitionList":getCompetitionList,
		"getCompetitionDetails":getCompetitionDetails,
		"getCompetitionScorers":getCompetitionScorers,
		"getCompetitionMatchesDetails":getCompetitionMatchesDetails,
		"getCompetitionTeamsList":getCompetitionTeamsList,
		"getTeamMatchesList":getTeamMatchesList,
		"getTeamStats":getTeamStats,
	};

	function getCompetitionList(){
		return new Promise(function(resolve,reject){

			var http = new XMLHttpRequest();
			http.open("GET", urlBase+"competitions?plan=TIER_ONE");
			http.setRequestHeader("X-Auth-Token", apikey);
			http.responseType="json";
			http.send();

			http.onload=function(){
				if (http.status == 200){
					resolve(http.response);
				}
				else {
					reject("Erreur")
				}
			};

			http.onerror=function(){
				reject("Erreur");
			};
		});
	}

	function getCompetitionDetails(id){
		return new Promise(function(resolve,reject){

			var http = new XMLHttpRequest();
			http.open("GET", urlBase+"competitions/"+id+"/standings/");
			http.setRequestHeader("X-Auth-Token", apikey);
			http.responseType="json";
			http.send();

			http.onload=function(){
				if (http.status == 200){
					resolve(http.response);
				}
				else {
					reject("Erreur")
				}
			};

			http.onerror=function(){
				reject("Erreur");
			};
		});
	}

	function getCompetitionScorers(id){
		return new Promise(function(resolve,reject){

			var http = new XMLHttpRequest();
			http.open("GET", urlBase+"competitions/"+id+"/scorers/");
			http.setRequestHeader("X-Auth-Token", apikey);
			http.responseType="json";
			http.send();

			http.onload=function(){
				if (http.status == 200){
					resolve(http.response);
				}
				else {
					reject("Erreur")
				}
			};

			http.onerror=function(){
				reject("Erreur");
			};
		});
	}

	function getCompetitionMatchesDetails(id){
		return new Promise(function(resolve,reject){

			var http = new XMLHttpRequest();
			http.open("GET", urlBase+"competitions/"+id+"/matches/");
			http.setRequestHeader("X-Auth-Token", apikey);
			http.responseType="json";
			http.send();

			http.onload=function(){
				if (http.status == 200){
					resolve(http.response);
				}
				else {
					reject("Erreur")
				}
			};

			http.onerror=function(){
				reject("Erreur");
			};
		});
	}

	function getCompetitionTeamsList(id){
		return new Promise(function(resolve,reject){

			var http = new XMLHttpRequest();
			http.open("GET", urlBase+"competitions/"+id+"/teams/");
			http.setRequestHeader("X-Auth-Token", apikey);
			http.responseType="json";
			http.send();

			http.onload=function(){
				if (http.status == 200){
					resolve(http.response);
				}
				else {
					reject("Erreur")
				}
			};

			http.onerror=function(){
				reject("Erreur");
			};
		});
	}

	function getTeamMatchesList(id){
		return new Promise(function(resolve,reject){

			var http = new XMLHttpRequest();
			http.open("GET", urlBase+"teams/"+id+"/matches/");
			http.setRequestHeader("X-Auth-Token", apikey);
			http.responseType="json";
			http.send();

			http.onload=function(){
				if (http.status == 200){
					resolve(http.response);
				}
				else {
					reject("Erreur")
				}
			};

			http.onerror=function(){
				reject("Erreur");
			};
		});
	}

	function getTeamStats(id){
		return new Promise(function(resolve,reject){

			var http = new XMLHttpRequest();
			http.open("GET", urlBase+"teams/"+id);
			http.setRequestHeader("X-Auth-Token", apikey);
			http.responseType="json";
			http.send();

			http.onload=function(){
				if (http.status == 200){
					resolve(http.response);
				}
				else {
					reject("Erreur")
				}
			};

			http.onerror=function(){
				reject("Erreur");
			};
		});
	}

	return service;
}


