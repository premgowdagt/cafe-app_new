<?php
echo "<h1>Welcome to shit cafe</h1>";

// Check if the user is trying to view the menu or place an order
if (isset($_GET['page'])) {
    if ($_GET['page'] == 'menu') {
        include('menu.php');  // Include the menu.php content
    } elseif ($_GET['page'] == 'order') {
        include('order.php');  // Include the order.php content
    }
} else {
    // Show the main page with links if no page is specified
    echo "<p><a href='?page=menu'>View Menu</a></p>";
    echo "<p><a href='?page=order'>Place an Order</a></p>";
}
?>
