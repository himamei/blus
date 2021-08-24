<html>
	<head>
	<link id="bootstrap_221" rel="stylesheet" type="text/css" class="library" href="/js/sandbox/bootstrap-2.2.1/css/bootstrap.min.css">
	<script id="jquery_172" type="text/javascript" class="library" src="/js/sandbox/jquery/jquery-1.7.2.min.js"></script>
	<script id="bootstrap_221" type="text/javascript" class="library" src="/js/sandbox/bootstrap-2.2.1/js/bootstrap.min.js"></script>
	</head>
<body>
	<div class="tree well">
    <ul>
        <li>
            <span><i class="icon-folder-open"></i> Parent</span> <a href="">Goes somewhere</a>
            <ul>
                <li>
                	<span><i class="icon-minus-sign"></i> Child</span> <a href="">Goes somewhere</a>
                    <ul>
                        <li>
	                        <span><i class="icon-leaf"></i> Grand Child</span> <a href="">Goes somewhere</a>
                        </li>
                    </ul>
                </li>
                <li>
                	<span><i class="icon-minus-sign"></i> Child</span> <a href="">Goes somewhere</a>
                    <ul>
                        <li>
	                        <span><i class="icon-leaf"></i> Grand Child</span> <a href="">Goes somewhere</a>
                        </li>
                        <li>
                        	<span><i class="icon-minus-sign"></i> Grand Child</span> <a href="">Goes somewhere</a>
                            <ul>
                                <li>
	                                <span><i class="icon-minus-sign"></i> Great Grand Child</span> <a href="">Goes somewhere</a>
		                            <ul>
		                                <li>
			                                <span><i class="icon-leaf"></i> Great great Grand Child</span> <a href="">Goes somewhere</a>
		                                </li>
		                                <li>
			                                <span><i class="icon-leaf"></i> Great great Grand Child</span> <a href="">Goes somewhere</a>
		                                </li>
		                             </ul>
                                </li>
                                <li>
	                                <span><i class="icon-leaf"></i> Great Grand Child</span> <a href="">Goes somewhere</a>
                                </li>
                                <li>
	                                <span><i class="icon-leaf"></i> Great Grand Child</span> <a href="">Goes somewhere</a>
                                </li>
                            </ul>
                        </li>
                        <li>
	                        <span><i class="icon-leaf"></i> Grand Child</span> <a href="">Goes somewhere</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </li>
        <li>
            <span><i class="icon-folder-open"></i> Parent2</span> <a href="">Goes somewhere</a>
            <ul>
                <li>
                	<span><i class="icon-leaf"></i> Child</span> <a href="">Goes somewhere</a>
		        </li>
		    </ul>
        </li>
    </ul>
</div>
<div class="tree">
    <ul>
        <li>
            <span><i class="icon-calendar"></i> 2013, Week 2</span>
            <ul>
                <li>
                	<span class="badge badge-success"><i class="icon-minus-sign"></i> Monday, January 7: 8.00 hours</span>
                    <ul>
                        <li>
	                        <a href=""><span><i class="icon-time"></i> 8.00</span> – Changed CSS to accomodate...</a>
                        </li>
                    </ul>
                </li>
                <li>
                	<span class="badge badge-success"><i class="icon-minus-sign"></i> Tuesday, January 8: 8.00 hours</span>
                    <ul>
                        <li>
	                        <span><i class="icon-time"></i> 6.00</span> – <a href="">Altered code...</a>
                        </li>
                        <li>
	                        <span><i class="icon-time"></i> 2.00</span> – <a href="">Simplified our approach to...</a>
                        </li>
                    </ul>
                </li>
                <li>
                	<span class="badge badge-warning"><i class="icon-minus-sign"></i> Wednesday, January 9: 6.00 hours</span>
                    <ul>
                        <li>
	                        <a href=""><span><i class="icon-time"></i> 3.00</span> – Fixed bug caused by...</a>
                        </li>
                        <li>
	                        <a href=""><span><i class="icon-time"></i> 3.00</span> – Comitting latest code to Git...</a>
                        </li>
                    </ul>
                </li>
                <li>
                	<span class="badge badge-important"><i class="icon-minus-sign"></i> Wednesday, January 9: 4.00 hours</span>
                    <ul>
                        <li>
	                        <a href=""><span><i class="icon-time"></i> 2.00</span> – Create component that...</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </li>
        <li>
            <span><i class="icon-calendar"></i> 2013, Week 3</span>
            <ul>
                <li>
                	<span class="badge badge-success"><i class="icon-minus-sign"></i> Monday, January 14: 8.00 hours</span>
                    <ul>
                        <li>
	                        <span><i class="icon-time"></i> 7.75</span> – <a href="">Writing documentation...</a>
                        </li>
                        <li>
	                        <span><i class="icon-time"></i> 0.25</span> – <a href="">Reverting code back to...</a>
                        </li>
                    </ul>
                </li>
		    </ul>
        </li>
    </ul>
</div>
<script type="text/javascript">
$(function () {
    $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
    $('.tree li.parent_li > span').on('click', function (e) {
        var children = $(this).parent('li.parent_li').find(' > ul > li');
        if (children.is(":visible")) {
            children.hide('fast');
            $(this).attr('title', 'Expand this branch').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
        } else {
            children.show('fast');
            $(this).attr('title', 'Collapse this branch').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
        }
        e.stopPropagation();
    });
});
</script>
</body>
</html>