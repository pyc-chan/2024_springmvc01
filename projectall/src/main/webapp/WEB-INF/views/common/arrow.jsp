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
	        window.location.href = `${cmd}?cPage=${nowPage}`; // 페이지 URL을 controller에서 처리
	    }
	}
</script>