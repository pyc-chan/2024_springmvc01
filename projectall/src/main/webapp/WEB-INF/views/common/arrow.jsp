<script>
	function moveToBlock(direction) {
	    const currentPage = ${paging.nowPage}; // 현재 페이지
	    const totalPages = ${paging.totalPages}; // 총 페이지 수
	    const pagePerBlock = ${paging.pagePerBlock}; // 블록 크기 (한 블록에 몇 페이지가 있는지)
	
	    let nowPage;
	
	    if (direction === 'first') {
	        nowPage = 1; // 첫 페이지로 이동
	    } else if (direction === 'previous') {
	        nowPage = Math.max(1, currentPage - pagePerBlock); // 이전 블록으로 이동
	    } else if (direction === 'next') {
	        nowPage = Math.min(totalPages, currentPage + pagePerBlock); // 다음 블록으로 이동
	    } else if (direction === 'last') {
	        nowPage = totalPages; // 마지막 페이지로 이동
	    }
		
	    // 페이지 이동
	    if (nowPage !== currentPage) {
	        // 페이지를 이동하는 방법에 따라 URL을 변경하거나 AJAX 요청을 보낼 수 있습니다.
	        window.location.href = `${cmd}?cPage=${nowPage}`; // 페이지 URL을 적절히 수정
	    }
	}
</script>