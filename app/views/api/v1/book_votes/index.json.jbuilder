<table>
  <thead>
    <tr>
      <th>Select this month's book</th>
      <th>Title</th>
      <th>Author(s)</th>
      <th>Votes</th>
    </tr>
  </thead>

  <tbody>
    <% @books.each do |book| %>
      <tr>
        <td>check_box_tag</td>
        <td><%= book[:title] %></td>
        <td><%= book[:author] %></td>
        <td><%= book[:votes] %></td>
      </tr>
    <% end %>
  </tbody>
</table>



json.array! @books.each do |book|
    json.partial! 'book.json.jbuilder', book: book
end