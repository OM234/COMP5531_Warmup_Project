<?php
include_once 'header.php';
?>
<div class="container">
    <!-- Introduction -->
    <section class="text-center mt-5 bg-light">
        <h3> Concordia University </h3>
        <h3>Dept. of Computer Science & Software Engineering</h3>
        <h3>Comp 5531- Files And Databases</h3>
        <p class="display-4">Warm-Up project</p>
        <h3>Team</h3>
        <div class="d-flex justify-content-center">
            <div class="row font-weight-bold">
                <div class="col-sm">
                    <ul class="list-group bg-light">
                        <li class="list-group-item bg-light border-0">
                        Osman Momoh <br>
                        ID: 26220150
                        </li>
                        <li class="list-group-item bg-light border-0">
                        Craig Boucher <br>
                        ID:21295721
                        </li>
                    </ul>
                </div>
                <div class="col-sm bg-light">
                    <ul class="list-group">
                        <li class="list-group-item bg-light border-0">
                        Fan Zou <br>
                        ID:40118112
                        </li>
                        <li class="list-group-item bg-light border-0">
                        Tanveer Alamgir
                        ID:40014877
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <?php
$baseURL = "php/controller.php?question=";
?>
    <!-- E/R diagram and All tables -->
    <section class="mt-3 p-2 bg-light">
        <p class="font-weight-bolder">E/R Diagram, count(*) of all relational tables & data in all entities and relational tables</p>
        <div class="erDiagram mt-2 d-flex justify-content-between">
            <a href="<?echo $baseURL . 13 ?>" target="_blank" class="btn btn-secondary stretch-link">E/R Diagram</a>
            <a href="<?echo $baseURL . 11 ?>" class="btn btn-secondary stretch-link">Count of all relation</a>
            <a href="<?echo $baseURL . 12 ?>" class="btn btn-secondary stretch-link">All tables</a>
        </div>
    </section>
    <!-- Queries -->

    <section class="bg-light mt-3 p-2">
        <p class="font-weight-bolder">Click each link below to run the query</p>
        <div class="queries mt-3">
            <div class="row">
                <div class="col-md">
                    <ol class="list-group">
                        <li class="list-group-item bg-light border-0"><a href="<?echo $baseURL . 1 ?>" class="btn btn-secondary stretch-link">i. Get details of all books in stock.</a></li>
                        <li class="list-group-item bg-light border-0"><a href="<?echo $baseURL . 2 ?>" class="btn btn-secondary stretch-link">ii. Get details of all back orders.</a></li>
                        <li class="list-group-item bg-light border-0"><a href="<?echo $baseURL . 3 ?>" class="btn btn-secondary stretch-link">iii. For a given customer, get details of all his/her back orders.</a></li>
                        <li class="list-group-item bg-light border-0"><a href="<?echo $baseURL . 4 ?>" class="btn btn-secondary stretch-link">iv. For a given customer, get details of all his/her purchases made during a
                        specific period of time.</a></li>
                        <li class="list-group-item bg-light border-0"><a href="<?echo $baseURL . 5 ?>" class="btn btn-secondary stretch-link">v. Give a report of sales during a specific period of time.</a></li>
                    </ol>
                </div>
                <div class="col-md">
                    <ol class="list-group">
                        <li class="list-group-item bg-light border-0"><a href="<?echo $baseURL . 6 ?>" class="btn btn-secondary stretch-link">vi. Find the title of book(s) that have the highest back-order.</a></li>
                        <li class="list-group-item bg-light border-0"><a href="<?echo $baseURL . 7 ?>" class="btn btn-secondary stretch-link">vii. Give details of books that are supplied by a given publisher.</a></li>
                        <li class="list-group-item bg-light border-0"><a href="<?echo $baseURL . 8 ?>" class="btn btn-secondary stretch-link">viii. For a given publisher, get details of the head office and all the branches for that publisher.</a></li>
                        <li class="list-group-item bg-light border-0"><a href="<?echo $baseURL . 9 ?>" class="btn btn-secondary stretch-link">ix. Get details of books that are in the inventory but there have never been a purchase for that specific book.</a></li>
                        <li class="list-group-item bg-light border-0"><a href="<?echo $baseURL . 10 ?>" class="btn btn-secondary stretch-link">x. Get details of all books that are in the inventory for a given author..</a></li>
                    </ol>
                </div>

            </div>
        </div>
    </section>
</div>
<?php
include_once 'footer.php';