<Scorers>
	
<h3>Buteurs</h3>
	<table class="table table-hover">
		<thead>
			<tr class="table-dark">
				<th>Buts</th>
				<th>Nom</th>
				<th>Equipe</th>
			</tr>
		</thead>
		<tbody>
			<tr each = "{el in opts.tab.scorers}">
				<td>{el.numberOfGoals}</td>
				<td>{el.player.name}</td>
				<td>{el.team.name}</td>
			</tr>
		</tbody>
	</table>

</Scorers>