<Standings>

	<h3>Classement journée {opts.day}</h3>

	<br>

	<div each="{group in opts.tab}">

		<h4><i>{group.group}</i></h4>

		<table class="table table-hover">
			<thead>
				<tr class="table-dark">
					<th>Rang</th>
					<th>Equipe</th>
					<th>Pts</th>
					<th>J</th>
					<th>M</th>
					<th>E</th>
					<th>Diff</th>
				</tr>
			</thead>
			<tbody>
				<tr each="{match in group.table}">
					<td>{match.position}</td>
					<td>
						<img if="{match.team.crestUrl != '' && match.team.crestUrl != null }" alt="" class="club-logo" src="{match.team.crestUrl}" height="25" width="25"></img>
						<a href="#team/{match.team.id}" >{match.team.name}</a>
					</td>
					<td>{match.points}</td>
					<td>{match.playedGames}</td>
					<td>{match.goalsFor}</td>
					<td>{match.goalsAgainst}</td>
					<td>{match.goalDifference}</td>
				</tr>
			</tbody>
		</table>

	</div>
	
</Standings>