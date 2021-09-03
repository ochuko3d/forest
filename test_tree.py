
import tree
import pytest

@pytest.fixture
def app():
    return tree.app
         

def test_dummy(app):
    resp = app.test_client().get('/')
    assert b"This is ochuko" in resp.data

def test_dummy3(app):
    resp = app.test_client().get('/tree')
    assert b"myFavoriteTree" in resp.data

