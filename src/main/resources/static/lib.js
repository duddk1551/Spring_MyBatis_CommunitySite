function Article__delete(id) {
	if ( confirm(id + '번 게시물을 삭제하시겠습니까?') == false ) {
		return;
	}
	
	location.href = '../article/doDelete?id=' + id;
}