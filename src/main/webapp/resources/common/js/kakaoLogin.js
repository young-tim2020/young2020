
	

	Kakao.init('9a77ae46974a9beb61d8452f66900b46'); //카카오 javascript 키

	
	//카카오 로그인 / 사용자 정보 요청 메소드
	function loginWithKakao() {
		Kakao.API.request({
			url: '/v1/user/unlink',
			success: function(res) {
			},
			fail: function(err) {
			},
		})
			
		Kakao.Auth.logout(function() { //로그아웃 메소드
			Kakao.Auth.login({ //카카오 로그인 메소드
		    	success: function(authObj) { //로그인을 시도하면 사용자 정보를 요청함
		    		Kakao.API.request({ //카카오 사용자 정보 요청 메소드
		    	        url: '/v2/user/me',
		    	        success: function(res) {
		    	        	//console.log(JSON.stringify(res)); // 로그인한 사용자 전제 정보
		    	        	//console.log(JSON.stringify(res.id)); // 식별 아이디
		    	        	//console.log(JSON.stringify(res.properties.nickname)); // 이름
		    	        	//console.log(JSON.stringify(res.kakao_account.email)); // 이메일
		    	        	//console.log(JSON.stringify(res.properties.profile_image)); //프로필 사진
		    	        	//console.log(JSON.stringify(res.connected_at)); // 로그인 날짜시간
		    		        //location.href="kakaoLogin.do?id=" + res.id + "&profile_image=" + res.properties.profile_image;
		    	        	location.href="kakaoLogin.do?id=" + res.kakao_account.email + "&profileImage=" + res.properties.profile_image;
		                    if (data == 'notKakaoId') {
		                		Kakao.API.request({
		                			url: '/v1/user/unlink',
		                			success: function(res) {
		                	        alert('success: ' + JSON.stringify(res))
		                			},
		                			fail: function(err) {
		                				alert('fail: ' + JSON.stringify(err))
		                			},
		                		})
		                    }
		    	        },
		    	        fail: function(error) {
		    	        	alert('login success, but failed to request user information: ' + JSON.stringify(error))
	    	        	},
		    		})
		    	},
	    		fail: function(err) {
	    			alert('failed to login: ' + JSON.stringify(err))
	    		},
		    })
		})
	}
//	function loginWithKakao() {
//    	Kakao.Auth.login({ //카카오 로그인 메소드
//	    	success: function(authObj) { //로그인을 시도하면 사용자 정보를 요청함
//	    		Kakao.API.request({ //카카오 사용자 정보 요청 메소드
//	    	        url: '/v2/user/me',
//	    	        success: function(res) {
//	    	        	//console.log(JSON.stringify(res)); // 로그인한 사용자 전제 정보
//	    	        	//console.log(JSON.stringify(res.id)); // 식별 아이디
//	    	        	//console.log(JSON.stringify(res.properties.nickname)); // 이름
//	    	        	//console.log(JSON.stringify(res.kakao_account.email)); // 이메일
//	    	        	//console.log(JSON.stringify(res.properties.profile_image)); //프로필 사진
//	    	        	//console.log(JSON.stringify(res.connected_at)); // 로그인 날짜시간
//	    		        //location.href="kakaoLogin.do?id=" + res.id + "&profile_image=" + res.properties.profile_image;
//	    	        	location.href="kakaoLogin.do?id=" + res.kakao_account.email + "&profileImage=" + res.properties.profile_image;
//	    	        },
//	    	        fail: function(error) {
//	    	        	alert('login success, but failed to request user information: ' + JSON.stringify(error))
//    	        	},
//	    		})
//	    	},
//    		fail: function(err) {
//    			alert('failed to login: ' + JSON.stringify(err))
//    		},
//	    })
//	}
	
	
//	function kakaoLogout() {
//		if (!Kakao.Auth.getAccessToken()) {
//			console('Kakao.Auth.getAccessToken() : ' + Kakao.Auth.getAccessToken());
//	    	return
//	    }
//	    Kakao.Auth.logout(function() {
//			alert('Kakao.Auth.getAccessToken() : ' + Kakao.Auth.getAccessToken())
//	    	alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken())
//	    })
//	}
	
	//카카오 연결끊기(회원탈퇴) 메소드
	function unlinkApp() {
		Kakao.API.request({
			url: '/v1/user/unlink',
			success: function(res) {
	        alert('success: ' + JSON.stringify(res))
			},
			fail: function(err) {
				alert('fail: ' + JSON.stringify(err))
			},
		})
	}