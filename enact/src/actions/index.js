import GetLocaleInfoUtil from './GetLocaleInfo';

export const UPDATE_LOCALE = 'UPDATE_LOCALE';

export const GETGLYPHSET_SUCCESS = 'GETGLYPHSET_SUCCESS';
export const GETLOCALEINFO_SUCCESS = 'GETLOCALEINFO_SUCCESS';

export const updateLocale = locale => {
	return {
		type: UPDATE_LOCALE,
		payload: locale
	};
};

export const getGlyphSetSuccess = payload => {
	return {
		type: GETGLYPHSET_SUCCESS,
		payload
	};
};

export const requestLocaleInfo = () => (dispatch) => {
	return GetLocaleInfoUtil.get(res => {
		dispatch({
			type: GETLOCALEINFO_SUCCESS,
			payload: res
		});
	});
};