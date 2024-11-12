<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<script defer src="/resources/js/admin_common.js"></script>
    
<div class="footer">© admin. All Rights Reserved.</div>

<script>
    const btns = document.querySelectorAll(".topmenu");

	function removeActiveClasses() {
		btns.forEach((btn) => {
			btn.parentElement.classList.remove("active");
		});
	}


    btns.forEach((btn) => {
		btn.addEventListener("click", () => {
			const menuitem = btn.parentNode;
			const isActive = menuitem.classList.contains("active");
			
			removeActiveClasses();
			
			if (!isActive) {
				menuitem.classList.add("active");
			}
		})
    });
</script>